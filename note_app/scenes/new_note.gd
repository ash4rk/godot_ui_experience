extends Control

@onready var title = $VBoxContainer/Control2/ScrollContainer/VBoxContainer/Control/HBoxContainer/VBoxContainer/TitleLineEdit
@onready var content = $VBoxContainer/Control2/ScrollContainer/VBoxContainer/Control/HBoxContainer/VBoxContainer/ContentTextEdit

var bg = ""
var id = ""

func reset() -> void:
	title.text = ""
	content.text = ""
	bg = Global.COLORS.CARDS[randi()%len(Global.COLORS.CARDS)]
	title.grab_focus()
	gen_id()

func gen_id():
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var id_lenght = 12
	id = ""
	for i in id_lenght:
		id += chars[randi()%chars.length()]

func _on_back_button_pressed():
	Global.go_back()

func _on_save_button_pressed() -> void:
	var unix_time: float = Time.get_unix_time_from_system()
	var dates = Time.get_datetime_dict_from_unix_time(unix_time)
	var note = {
		"title": title.text,
		"content": content.text,
		"bg": bg,
		"date": "{month} {date} {year}".format({
			"month": dates['month'],
			"date": dates['day'],
			"year": dates['year'],
		})
	}
	
	#open the file 
	var file = FileAccess.open("res://data.json", FileAccess.READ_WRITE)
	#parse it to check for errors
	var json = JSON.new()
	var _parse_result = json.parse(file.get_as_text())
	
	var data: Dictionary
	if json.get_data() == null:
		data = {}
	else:
		data = json.get_data()
		
	#get the dictionary from the json and add [id] 
	data[id] = note

	#\t makes a newline for each indent in json to be more readable
	var json_string_new = JSON.stringify(data, "\t")
	file.store_line(json_string_new)
	file.close()
