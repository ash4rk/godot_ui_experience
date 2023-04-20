extends Control

var card = preload("res://scenes/card.tscn")
@onready var hbox = $VBoxContainer/PanelContainer/ScrollContainer/VBoxContainer/HBoxContainer

func _ready() -> void:
	create_vboxes()
	var data = _get_data()
	

func _get_data() -> Dictionary:
	var file = FileAccess.open("res://data.json", FileAccess.READ_WRITE)
	#parse it to check for errors
	var json = JSON.new()
	var _parse_result = json.parse(file.get_as_text())
	
	var data: Dictionary
	if json.get_data() == null:
		data = {}
	else:
		data = json.get_data()

	#\t makes a newline for each indent in json to be more readable
	var json_string_new = JSON.stringify(data, "\t")
	file.store_line(json_string_new)
	file.close()
	return data

func _set_up(vboxes) -> void:
	var datas = _get_data()
	var num_of_vbox = hbox.get_child_count()
	var count = 0
	for data in datas.values():
		var card_item = card.instantiate()
		card_item.set_up(data)
		
		vboxes[count].add_child(card_item)
		
		count += 1
		if count > num_of_vbox:
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
		vboxes.append(vbox)
	return vboxes

func _on_resized():
	if visible:
		var vboxes = create_vboxes()
		_set_up(vboxes)

func _on_new_note_button_pressed():
	Global.set_path("/new")
	$"../NewNote".reset()

func _on_visibility_changed():
	if visible:
		var vboxes = create_vboxes()
		_set_up(vboxes)
