extends Control


@onready var audio_name = $HBoxContainer/Audio_Name as Label
@onready var h_slider = $HBoxContainer/HSlider as HSlider
@onready var audio_number = $HBoxContainer/Audio_Number as Label

@export_enum("Master", "Music", "SFX") var audio_bus_name : String

var audio_bus_index : int = 0


func _ready():
	h_slider.value_changed.connect(on_value_changed)
	get_audio_bus_name()
	load_data()
	set_audio_bus_label_name()
	set_hslider_value()


func load_data() -> void:
	match audio_bus_name:
		"Master":
			on_value_changed(SettingsDataContainer.get_master_volume())
		"Music":
			on_value_changed(SettingsDataContainer.get_music_volume())
		"SFX":
			on_value_changed(SettingsDataContainer.get_sfx_volume())


func set_audio_bus_label_name() -> void:
	audio_name.text = str(audio_bus_name) + " Volume"


func set_audio_label_number() -> void:
	audio_number.text = str(h_slider.value * 10)


func get_audio_bus_name() -> void:
	audio_bus_index = AudioServer.get_bus_index(audio_bus_name)


func set_hslider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(audio_bus_index))
	set_audio_label_number()


func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_index, linear_to_db(value))
	set_audio_label_number()
	
	match audio_bus_index:
		0:
			SettingsManager.emit_on_master_sound_set(value)
		1:
			SettingsManager.emit_on_music_sound_set(value)
		2:
			SettingsManager.emit_on_sfx_sound_set(value)
