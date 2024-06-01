class_name Editor

extends EventManager

@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/Play_Button as Button
@onready var settings_button = $MarginContainer/HBoxContainer/VBoxContainer/Settings_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var settings_menu = $Settings_Menu as SettingsMenu
@onready var margin_container = $MarginContainer as MarginContainer

@onready var start_level = preload("res://scenes/main/Level1.tscn") as PackedScene

var events : EventManager


func _init():
	events = EventManager.new()


func _ready():
	pass


func on_start_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_packed(start_level)
	events.notify("start", null)


func on_settings_pressed():
	margin_container.visible = false
	settings_menu.set_process(true)
	settings_menu.visible = true
	events.notify("settings", null)


func on_exit_pressed():
	events.notify("exit", null)
	get_tree().quit()


func on_back_to_main_menu():
	margin_container.visible = true
	settings_menu.visible = false
	events.notify("back_to_main_menu", null)
