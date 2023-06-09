extends ColorRect

func _on_cancel_button_pressed():
	Global.go_back()

func _on_delete_button_pressed():
	var id_to_delete = Global.PATH.trim_prefix("/delete/")
	var data = Global.get_data()
	var file = FileAccess.open(Global.SAVE_FILE_PATH, FileAccess.WRITE)
	if data.has(id_to_delete):
		data.erase(id_to_delete)
	var json_string_new = JSON.stringify(data, "\t")
	file.store_line(json_string_new)
	file.close()
	#TODO(): Remove when custom popup delete is ipmlemented
	$"../Home"._ready()
	Global.go_back()
	Global.NOTIFICATION.show_notif("Note deleted")
