extends Control

@onready var check_box = $HBoxContainer/CheckBox as CheckBox


func _ready():
	check_box.toggled.connect(on_toggled)


func on_toggled(value : bool) -> void:
	AudioServer.set_bus_mute(0, not linear_to_db(value))
