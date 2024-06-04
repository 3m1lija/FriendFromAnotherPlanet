extends CharacterBody2D

@onready var sprite = $Sprite as Sprite2D
@onready var animation_player = $AnimationPlayer as AnimationPlayer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D as AudioStreamPlayer2D

@export var move_speed : float = 125.0
@export var jump_force : float = 250.0
@export var fall_speed : float = 200.0

const GRAVITY : float = 800.0

@onready var context = $"../Context"


func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE


func _physics_process(delta):
	if not is_on_floor():
		apply_gravity(delta)
	
	#code picks a concrete strategy based on the input and passes it to the context
	if Input.is_action_just_pressed("jump") and is_on_floor():
		context.set_move_strategy(ConcreteStrategyJump.new())
	else:
		context.set_move_strategy(ConcreteStrategyWalk.new())
	
	context.move(self)


	velocity.normalized()
	move_and_slide()

	flip_character()
	
	handle_animation()
	
	if global_position.y > 100:
		game_over()


func apply_gravity(delta : float) -> void:
	#prebuild variable within the class of CharacterBody2D
	velocity.y += GRAVITY * delta


func flip_character() -> void:
	#character is moving right
	if velocity.x > 0:
		sprite.flip_h = true
		
	#character is moving left
	if velocity.x < 0:
		sprite.flip_h = false


func handle_animation() -> void:
	#checks if the character is in "idle" position
	#Vector2 is stored like this - Vector2(0, 0)
	if velocity == Vector2.ZERO:
		animation_player.play("idle")
	
	#checks if the character is in "run" position
	if velocity.x != 0 and velocity.y == 0:
		animation_player.play("run")
		
	#checks if the character is in "jump" position
	if velocity.y != 0:
		animation_player.play("jump")


func game_over():
	get_tree().reload_current_scene()
