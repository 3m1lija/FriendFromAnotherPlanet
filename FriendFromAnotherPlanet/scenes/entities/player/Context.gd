extends Node

#Context defines the interface of interest to clients
class_name Context


var move_strategy: MoveStrategy


func set_move_strategy(move_strategy : MoveStrategy):
	self.move_strategy = move_strategy


func move(character : CharacterBody2D):
	move_strategy.move(character)
