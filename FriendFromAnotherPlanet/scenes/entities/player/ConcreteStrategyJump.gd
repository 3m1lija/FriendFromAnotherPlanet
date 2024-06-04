extends MoveStrategy

class_name ConcreteStrategyJump

@export var jump_force: float = 250.0
@export var fall_speed : float = 200.0


func move(character: CharacterBody2D):
	character.velocity.y = -jump_force
	character.audio_stream_player_2d.play()
	character.velocity.y = clamp(character.velocity.y, -jump_force, fall_speed)
