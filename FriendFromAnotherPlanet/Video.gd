extends TabBar


func _ready():
	var display_mode_index = Persistence.config.get_value("Video", "displaymode")
	%DisplayMode.selected = display_mode_index


func _on_display_mode_item_selected(index):
	if index == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Persistence.config.set_value("Video", "displaymode", DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Persistence.config.set_value("Video", "displaymode", DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	Persistence.save_data()
