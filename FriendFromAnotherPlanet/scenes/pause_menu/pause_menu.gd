class_name PauseMenu

extends Control

signal exit_to_main_menu()

@onready var resume_button = $PanelContainer/MarginContainer/VBoxContainer/Resume_Button as Button
@onready var exit_to_main_button = $PanelContainer/MarginContainer/VBoxContainer/Exit_To_Main_Button as Button
@onready var animation_player = $AnimationPlayer as AnimationPlayer

@onready var main_menu = preload("res://scenes/main_menu/main_menu.tscn") as PackedScene


func _ready():
	resume_button.button_down.connect(on_resume_pressed)
	exit_to_main_button.button_down.connect(on_exit_pressed)


func _process(delta):
	check_esc()


func resume() -> void:
	get_tree().paused = false
	animation_player.play_backwards("blur")


func pause() -> void:
	get_tree().paused = true
	animation_player.play("blur")


func on_resume_pressed() -> void:
	resume()


func on_exit_pressed() -> void:
	#change the main menu scene to level scene
	exit_to_main_menu.emit()


func check_esc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()


func handle_connecting_signals() -> void:
	resume_button.button_down.connect(on_resume_pressed)
	exit_to_main_button.button_down.connect(on_exit_pressed)
