class_name MainMenu

extends MainMenuManager

@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/Play_Button as Button
@onready var settings_button = $MarginContainer/HBoxContainer/VBoxContainer/Settings_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var settings_menu = $Settings_Menu as SettingsMenu
@onready var margin_container = $MarginContainer as MarginContainer

@onready var start_level = preload("res://scenes/main/Level1.tscn") as PackedScene


func _ready():
	handle_connecting_signals()
	setup_observers()


func on_start_pressed() -> void:
	#change the main menu scene to level scene
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_packed(start_level)
	notify("start_pressed")


func on_settings_pressed() -> void:
	margin_container.visible = false
	settings_menu.set_process(true)
	settings_menu.visible = true
	notify("settings_pressed")


func on_exit_pressed() -> void:
	#get scene tree
	get_tree().quit()
	notify("exit_pressed")


func on_back_to_main_menu() -> void:
	margin_container.visible = true
	settings_menu.visible = false
	notify("back_to_main_menu")


func handle_connecting_signals() -> void:
	play_button.button_down.connect(on_start_pressed)
	settings_button.button_down.connect(on_settings_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	settings_menu.back_to_main_menu.connect(on_back_to_main_menu)


func setup_observers() -> void:
	var play_button_observer = ButtonObserver.new("Play")
	var settings_button_observer = ButtonObserver.new("Settings")
	var exit_button_observer = ButtonObserver.new("Exit")
	var settings_menu_observer = SettingsMenuObserver.new()

	subscribe("start_pressed", play_button_observer)
	subscribe("settings_pressed", settings_button_observer)
	subscribe("exit_pressed", exit_button_observer)
	subscribe("back_to_main_menu", settings_menu_observer)
