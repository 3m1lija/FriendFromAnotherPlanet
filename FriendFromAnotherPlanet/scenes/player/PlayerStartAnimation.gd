extends CharacterBody2D

@onready var sprite = $Sprite as Sprite2D
@onready var animation_player = $AnimationPlayer as AnimationPlayer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D as AudioStreamPlayer2D

@onready var start_first_level = preload("res://scenes/main/Level1.tscn") as PackedScene


func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)


func _on_dialogue_manager_dialogue_ended(resource: DialogueResource) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_packed(start_first_level)


func _physics_process(delta):
	handle_idle_animation()


func handle_idle_animation() -> void:
	animation_player.play("idle")


func _unhandled_input(_event : InputEvent) -> void:
	if Input.is_action_just_pressed("do_dialogue"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/first_scene.dialogue"), "start")
		return
