extends Control

@onready var check_box = $HBoxContainer/CheckBox as CheckBox


func _ready():
	check_box.toggled.connect(on_toggled)
	load_data()


func load_data() -> void:
	on_toggled(SettingsDataContainer.get_sound_mute_set())


func on_toggled(value : bool) -> void:
	SettingsManager.emit_on_sound_mute_set(value)
	AudioServer.set_bus_mute(0, not linear_to_db(value))
