extends Control

var card = preload("res://scenes/card.tscn")

func _ready() -> void:
	create_vboxes()

func create_vboxes():
	var x = size.x
	
	var number_of_vbox = floor(x/250)
	var hbox = $"VBoxContainer/PanelContainer/ScrollContainer/VBoxContainer/HBoxContainer"

	for c in hbox.get_children():
		c.queue_free()
	
	for n in number_of_vbox:
		var vbox = VBoxContainer.new()
		hbox.add_child(vbox)
		var card_new = card.instantiate()
		vbox.add_child(card_new)

func _on_resized():
	create_vboxes()

func _on_new_note_button_pressed():
	Global.set_path("/new")
	$"../NewNote".reset()
