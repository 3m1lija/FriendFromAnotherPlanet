extends Camera2D

var target : CharacterBody2D = null

func _ready():
	handle_signals()


func _process(delta):
	follow_target()


func follow_target() -> void:
	if target == null:
		return
	position = target.position


func get_target(target_cb : CharacterBody2D) -> void:
	target = target_cb


func handle_signals() -> void:
	pass
