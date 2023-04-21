extends Control

var card = preload("res://scenes/card.tscn")
@onready var hbox = $VBoxContainer/PanelContainer/ScrollContainer/VBoxContainer/HBoxContainer

func _ready() -> void:
	var vboxes = create_vboxes()
	_set_up(vboxes)

func _set_up(vboxes: Array) -> void:
	var datas = Global.get_data()
	var num_of_vbox = vboxes.size()
	var count = 0
	for data in datas.values():
		var card_item = card.instantiate()
		card_item.set_up(data)
		
		vboxes[count].add_child(card_item)
		
		count += 1
		if count >= num_of_vbox:
			count = 0
		
func create_vboxes():
	var x = size.x
	var number_of_vbox = floor(x/250)
	for c in hbox.get_children():
		c.queue_free()
	var vboxes = []
	for n in number_of_vbox:
		var vbox = VBoxContainer.new()
		hbox.add_child(vbox)
		vbox.add_theme_constant_override("separation", 20)
		vboxes.append(vbox)
	return vboxes

func _on_resized():
	if visible and hbox != null:
		var vboxes = create_vboxes()
		_set_up(vboxes)

func _on_new_note_button_pressed():
	Global.set_path("/new")
	$"../NewNote".reset()

func _on_visibility_changed():
	if visible and hbox != null:
		var vboxes = create_vboxes()
		_set_up(vboxes)
