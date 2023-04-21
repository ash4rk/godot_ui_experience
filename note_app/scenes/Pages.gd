extends Control

@export var HomePath: NodePath
@export var NewNotePath: NodePath
@export var NotePath: NodePath
@export var EditNotePath: NodePath

@onready var Home = get_node(HomePath)
@onready var NewNote = get_node(NewNotePath)
@onready var Note = get_node(NotePath)
@onready var EditNote = get_node(EditNotePath)

func _process(_delta):
	if Global.PATH == "/" and not Home.visible:
		Home.visible = true
		NewNote.visible = false
		Note.visible = false
		EditNote.visible = false
	elif Global.PATH == "/new" and not NewNote.visible:
		Home.visible = false
		NewNote.visible = true
		Note.visible = false
		EditNote.visible = false
	elif Global.PATH.begins_with("/read/") and not Note.visible:
		Home.visible = false
		NewNote.visible = false
		Note.visible = true
		EditNote.visible = false
	elif Global.PATH.begins_with("/edit/") and not EditNote.visible:
		Home.visible = false
		NewNote.visible = false
		Note.visible = false
		EditNote.visible = true
