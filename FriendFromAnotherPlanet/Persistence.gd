extends Node


const PATH = "user://settings.cfg"
var config = ConfigFile.new()


func _ready():
	config.set_value("Video", "displaymode", DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	for i in range(3):
		config.set_value("Audio", str(i), 0.0)
		
	#config.set_value("Audio", "sound", false)
	
	load_data()	


func save_data():
	config.save(PATH)


func load_data():
	if config.load("user://settings.cfg") != OK:
		save_data()
		return

	load_video_settings()


func load_video_settings():
	var display_mode_index = config.get_value("Video", "displaymode")
	DisplayServer.window_set_mode(display_mode_index)
