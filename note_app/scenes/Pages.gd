extends Control

@export var HomePath: NodePath
@export var NewNotePath: NodePath
@export var NotePath: NodePath

@onready var Home = get_node(HomePath)
@onready var NewNote = get_node(NewNotePath)
@onready var Note = get_node(NotePath)

func _process(_delta):
	if Global.PATH == "/" and not Home.visible:
		Home.visible = true
		NewNote.visible = false
		Note.visible = false
	elif Global.PATH == "/new" and not NewNote.visible:
		Home.visible = false
		NewNote.visible = true
		Note.visible = false
	elif Global.PATH.begins_with("/read/") and not Note.visible:
		Home.visible = false
		NewNote.visible = false
		Note.visible = true

