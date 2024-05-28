extends Node

#creates the name of saave path file
const SETTINGS_SAVE_PATH : String = "user://settings.save"

#creates an empty dictionary that will later act as a dictionary for settings 
var settings_data_dict : Dictionary = {}


func _ready():
	SettingsManager.set_settings_dictionary.connect(on_save_settings)
	load_settings_data()


func on_save_settings(data : Dictionary) -> void:
	var save_settings_data_file = FileAccess.open(SETTINGS_SAVE_PATH, FileAccess.WRITE)
	
	var json_data = JSON.stringify(data)
	
	#stores each line of the json data (string format)
	save_settings_data_file.store_line(json_data)


func load_settings_data() -> void:
	#checks if settings data file exists
	if not FileAccess.file_exists(SETTINGS_SAVE_PATH):
		return
	
	var save_settings_data_file = FileAccess.open(SETTINGS_SAVE_PATH, FileAccess.READ)
	var loaded_data : Dictionary = {}
	
	#checks settings data file
	while save_settings_data_file.get_position() < save_settings_data_file.get_length():
		var json_string = save_settings_data_file.get_line()
		var json = JSON.new()
		var _parsed_result = json.parse(json_string)
		
		loaded_data = json.get_data()
	
	SettingsManager.emit_load_settings_data(loaded_data)
