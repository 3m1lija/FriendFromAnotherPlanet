class_name PauseMenu

extends Control

@onready var resume_button = $PanelContainer/MarginContainer/VBoxContainer/Resume_Button as Button
@onready var exit_to_main_button = $PanelContainer/MarginContainer/VBoxContainer/Exit_To_Main_Button as Button
@onready var main_menu = $Main_Menu as MainMenu
@onready var margin_container = $PanelContainer/MarginContainer
@onready var animation_player = $AnimationPlayer as AnimationPlayer


func _ready():
	print("Pause menu ready")
	print("Resume button: ", resume_button)
	print("Exit to main button: ", exit_to_main_button)
	print("Animation player: ", animation_player)
	
	resume_button.pressed.connect(on_resume_pressed)
	exit_to_main_button.pressed.connect(on_exit_pressed)
	hide()


func _process(delta):
	check_esc()


func resume() -> void:
	hide()
	get_tree().paused = false
	if animation_player:
		animation_player.play_backwards("blur")
	else:
		print("AnimationPlayer is null")


func pause() -> void:
	get_tree().paused = true
	show()
	if animation_player:
		animation_player.play("blur")
	else:
		print("AnimationPlayer is null")


func on_resume_pressed() -> void:
	resume()


func on_exit_pressed() -> void:
	resume()
	#change the pause menu scene to main menu scene
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")


func check_esc():
	if Input.is_action_just_pressed("escape"):
		if get_tree().paused:
			resume()
		else:
			pause()


func handle_connecting_signals() -> void:
	resume_button.button_down.connect(on_resume_pressed)
	exit_to_main_button.button_down.connect(on_exit_pressed)
