extends CharacterBody2D

@onready var sprite = $Sprite as Sprite2D
@onready var animation_player = $AnimationPlayer as AnimationPlayer

@export var move_speed : float = 125.0
@export var jump_force : float = 250.0
@export var fall_speed : float = 200.0

const GRAVITY : float = 800.0


func _ready() -> void:
	#handle_signals()
	#signal_bus.emit_set_camera_target(self)
	pass


func _physics_process(delta):
	if not is_on_floor():
		apply_gravity(delta)
		
	handle_movement()
	handle_jump()

	move_and_slide()

	flip_character()
	
	handle_animation()
	
	if global_position.y > 100:
		game_over()


func apply_gravity(delta : float) -> void:
	#prebuild variable within the class of CharacterBody2D
	velocity.y += GRAVITY * delta


func handle_movement() -> void:
	#if player wants to move right - it sets the movement direction as a positive number,
	#otherwise, it's set as a negative number
	var movement_direction : float = Input.get_axis("move_left", "move_right")
	
	#nothing is changed, the character stays still
	velocity.x = 0.0
	
	if movement_direction < 0:
		velocity.x -= move_speed
	if movement_direction > 0:
		velocity.x += move_speed


func handle_jump() -> void:
	if Input.is_action_just_pressed("jump") == true and is_on_floor() == true:
		velocity.y = -jump_force
		
	clampf(velocity.y, jump_force, fall_speed)


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
