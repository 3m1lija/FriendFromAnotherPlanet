extends CharacterBody2D

@onready var sprite = $Sprite as Sprite2D
@onready var animation_player = $AnimationPlayer as AnimationPlayer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D as AudioStreamPlayer2D


func _ready():
	pass


func _physics_process(delta):
	handle_idle_animation()


func handle_idle_animation() -> void:
	animation_player.play("idle")
