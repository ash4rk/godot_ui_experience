extends PanelContainer

var bg = "#f5b7b1"
var id = ""

func _read() -> void:
	pass

func set_up(data):
	print(data)
	get_theme_stylebox("panel", "").bg_color = data.bg
	$VBoxContainer/Title.text = data.title
	$VBoxContainer/Date.text = data.date
	id = data.id

func _on_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.get_button_index() == 1:
		Global.set_path("/read/" + id)
