extends Control

@export var HomePath: NodePath
@export var NewNotePath: NodePath

@onready var Home = get_node(HomePath)
@onready var NewNote = get_node(NewNotePath)

func _process(_delta):
	if Global.PATH == "/" and not Home.visible:
		Home.visible = true
		NewNote.visible = false
	elif Global.PATH == "/new" and not NewNote.visible:
		Home.visible = false
		NewNote.visible = true

