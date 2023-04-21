extends Control

@onready var title = $VBoxContainer/Control2/ScrollContainer/VBoxContainer/Control/HBoxContainer/VBoxContainer/TitleLineEdit
@onready var content = $VBoxContainer/Control2/ScrollContainer/VBoxContainer/Control/HBoxContainer/VBoxContainer/ContentTextEdit

var old_data: Dictionary = {
		"title" : "title  here",
		"content" : "content  here", 
	}

func _set_up() -> void:
	title.text = old_data.title
	content.text = old_data.content

func _on_save_button_pressed():
	var id = Global.PATH.trim_prefix("/edit/")
	var data = Global.get_data()
	data[id].title = title.text
	data[id].content = content.text
	var file = FileAccess.open(Global.SAVE_FILE_PATH, FileAccess.READ_WRITE)
	var json = JSON.new()
	var _parse_result = json.parse(file.get_as_text())
	var json_string_new = JSON.stringify(data, "\t")
	file.store_line(json_string_new)
	file.close()
	Global.go_back()

func _on_back_button_pressed():
	if old_data.title != title.text or old_data.content != content.text:
		$Popup.visible = true
	else:
		Global.go_back()

func _on_popup_canceled():
	$Popup.visible = false

func _on_popup_confirmed():
	Global.go_back()

func _on_visibility_changed():
	if visible:
		_set_up()
