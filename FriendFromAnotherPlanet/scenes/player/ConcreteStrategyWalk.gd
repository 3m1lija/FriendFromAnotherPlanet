extends MoveStrategy

#One of the concrete strategies of the base Strategy class
class_name ConcreteStrategyWalk

@export var move_speed: float = 125.0

func move(character: CharacterBody2D):
	#if player wants to move right - it sets the movement direction as a positive number,
	#otherwise, it's set as a negative number
	var movement_direction: float = Input.get_axis("move_left", "move_right")
	
	#nothing is changed, the character stays still
	character.velocity.x = 0.0

	if movement_direction < 0:
		character.velocity.x -= move_speed
	elif movement_direction > 0:
		character.velocity.x += move_speed
