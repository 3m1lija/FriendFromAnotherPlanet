class_name MainMenu

extends Control

@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/Play_Button as Button
@onready var settings_button = $MarginContainer/HBoxContainer/VBoxContainer/Settings_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var settings_menu = $Settings_Menu as SettingsMenu
@onready var margin_container = $MarginContainer as MarginContainer

@onready var start_level = preload("res://scenes/main/Level1.tscn") as PackedScene

var editor = Editor.new()

func _ready():
	# Add editor to the scene tree
	add_child(editor)
	
	var play_button_listener = PlayButtonListener.new()
	var settings_button_listener = SettingsButtonListener.new()
	var exit_button_listener = ExitButtonListener.new()
	var back_to_main_menu_listener = BackToMainMenuListener.new()

	editor.events.subscribe("start", play_button_listener)
	editor.events.subscribe("settings", settings_button_listener)
	editor.events.subscribe("exit", exit_button_listener)
	editor.events.subscribe("back_to_main_menu", back_to_main_menu_listener)
		
	handle_connecting_signals()


#func on_start_pressed() -> void:
	##change the main menu scene to level scene
	#await get_tree().create_timer(0.1).timeout
	#get_tree().change_scene_to_packed(start_level)
#
#
#func on_settings_pressed() -> void:
	#margin_container.visible = false
	#settings_menu.set_process(true)
	#settings_menu.visible = true
#
#
#func on_exit_pressed() -> void:
	##get scene tree
	#get_tree().quit()
#
#
#func on_back_to_main_menu() -> void:
	#margin_container.visible = true
	#settings_menu.visible = false
#
#
func handle_connecting_signals() -> void:
	play_button.button_down.connect(editor.on_start_pressed)
	settings_button.button_down.connect(editor.on_settings_pressed)
	exit_button.button_down.connect(editor.on_exit_pressed)
	settings_menu.back_to_main_menu.connect(editor.on_back_to_main_menu)
