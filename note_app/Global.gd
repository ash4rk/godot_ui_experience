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

var PATH = "/"
var LAST_PATH = "/"

func go_back() -> void:
	PATH = LAST_PATH

func set_path(path) -> void:
	LAST_PATH = PATH
	PATH = path
