extends Control

@onready var notif_label = $PanelContainer/HBoxContainer/NotificationLabel

func show_notif(message: String) -> void:
	notif_label.text = message
	$AnimationPlayer.play("show")

func _on_close_notif_button_pressed():
	$AnimationPlayer.seek(3.0)
