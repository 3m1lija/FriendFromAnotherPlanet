extends Node

@onready var end_game = preload("res://scenes/main_menu/main_menu.tscn") as PackedScene


func _ready():
	DialogueManager.show_dialogue_balloon(load("res://dialogue/first_scene.dialogue"), "start")
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)


func _physics_process(delta):
	pass


func _on_dialogue_manager_dialogue_ended(resource: DialogueResource) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_packed(end_game)


func _unhandled_input(_event : InputEvent) -> void:
	if Input.is_action_just_pressed("do_dialogue"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/first_scene.dialogue"), "start")
		return
