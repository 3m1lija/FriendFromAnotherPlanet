class_name RobotPart

extends Area2D

@onready var animation_player = $AnimationPlayer as AnimationPlayer


# Signal to notify that the part has been picked up
signal part_picked_up


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", _on_body_entered)


func _physics_process(delta):
	handle_animation()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("part_picked_up")
		queue_free() # Remove the part from the scene


func handle_animation() -> void:
	animation_player.play("idle")
