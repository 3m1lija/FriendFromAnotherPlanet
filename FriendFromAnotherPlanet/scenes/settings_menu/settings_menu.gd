class_name SettingsMenu

extends Control

@onready var back_button = $MarginContainer/VBoxContainer/Back_Button as Button

signal back_to_main_menu


func _ready():
	back_button.button_down.connect(on_back_pressed)
	set_process(false)


func on_back_pressed() -> void:
	back_to_main_menu.emit()
	SettingsManager.emit_set_settings_dictionary(SettingsDataContainer.create_dictionary())
	set_process(false)
