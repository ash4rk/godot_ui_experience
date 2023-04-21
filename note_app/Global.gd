extends Node

const COLORS = {
	"bg" : "#262626",
	"card_bg" : "#3c3c3c",
	"accent" : "#d7bde2",
	"text" : "#E2E2E2",
	"text_dim" : "#878787",
	"text_higlight" : "#FBFAFB",
	"CARDS" : ["#e6b0aa", "#f5b7b1", "#d2b4de", "#a9cce3", "#aed6f1",
			"#a2d9ce", "#f9e79f", "#f5cba7", "#f7f9f9", "#abebc6"]
}

@onready var NOTIFICATION = get_node("/root/Control/NotificationArea")
var PATH: String = "/"
var LAST_PATH: String = "/"
var SAVE_FILE_PATH: String = "user://gnotes_data.json"

func go_back() -> void:
	PATH = LAST_PATH

func set_path(path) -> void:
	LAST_PATH = PATH
	PATH = path

func get_data() -> Dictionary:
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ_WRITE)
	if not FileAccess.file_exists(SAVE_FILE_PATH):
		file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	
	#parse it to check for errors
	var json = JSON.new()
	var _parse_result = json.parse(file.get_as_text())
	
	var data: Dictionary
	if json.get_data() == null:
		return {}
	else:
		data = json.get_data()

	#\t makes a newline for each indent in json to be more readable
	var json_string_new = JSON.stringify(data, "\t")
	file.store_line(json_string_new)
	file.close()
	return data
