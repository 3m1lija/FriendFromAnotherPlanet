extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://scenes/resources/settings/DefaultSettingsResource.tres")

var display_type_index : int = 0
var master_volume : float = 0.0
var music_volume : float = 0.0
var sfx_volume : float = 0.0
var sound_muted : bool = false


var loaded_settings_data : Dictionary = {}


func _ready():
	handle_signals()
	create_dictionary()


func create_dictionary() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"display_type_index" : display_type_index,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"sound_muted" : sound_muted
	}
	return settings_container_dict


func get_display_type_index() -> int:
	if loaded_settings_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_DISPLAY_TYPE_INDEX
	return display_type_index


func get_master_volume() -> float:
	if loaded_settings_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MASTER_VOLUME
	return master_volume


func get_music_volume() -> float:
	if loaded_settings_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MUSIC_VOLUME
	return music_volume


func get_sfx_volume() -> float:
	if loaded_settings_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SFX_VOLUME
	return sfx_volume


func get_sound_mute_set() -> bool:
	if loaded_settings_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SOUND_MUTED
	return sound_muted


func on_display_type_selected(index : int) -> void:
	display_type_index = index


func on_master_sound_set(value : float) -> void:
	master_volume = value


func on_music_sound_set(value : float) -> void:
	music_volume = value


func on_sfx_sound_set(value : float) -> void:
	sfx_volume = value


func on_sound_mute_set(toggled : bool) -> void:
	sound_muted = toggled


func on_settings_data_loaded(data : Dictionary) -> void:
	#loads data sets the values of variables
	loaded_settings_data = data
	on_display_type_selected(loaded_settings_data.display_type_index)
	on_master_sound_set(loaded_settings_data.master_volume)
	on_music_sound_set(loaded_settings_data.music_volume)
	on_sfx_sound_set(loaded_settings_data.sfx_volume)
	on_sound_mute_set(loaded_settings_data.sound_muted)


func handle_signals() -> void:
	SettingsManager.on_display_type_selected.connect(on_display_type_selected)
	SettingsManager.on_master_sound_set.connect(on_master_sound_set)
	SettingsManager.on_music_sound_set.connect(on_music_sound_set)
	SettingsManager.on_sfx_sound_set.connect(on_sfx_sound_set)
	SettingsManager.on_sound_mute_set.connect(on_sound_mute_set)
	SettingsManager.load_settings_data.connect(on_settings_data_loaded)
