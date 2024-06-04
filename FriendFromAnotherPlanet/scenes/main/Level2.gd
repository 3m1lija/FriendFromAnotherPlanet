class_name Level2

extends Node2D

var parts_collected = 0
#var part_counter_label


# Called when the node enters the scene tree for the first time.
func _ready():
	var robot_part = $Entity/RobotPart
	# Connect the part_picked_up signal to the spawn_new_area method
	robot_part.connect("part_picked_up", show_end_flag)

	#part_counter_label = $Label
	
	# Initially hide the end flag
	$Level/EndFlag.hide()
	
	#update_ui_counter()


# Function to spawn the new area (EndFlag)
func show_end_flag():
	#parts_collected += 1
	#update_ui_counter()
	
	# Store the collected parts count for the next level
	Global.collected_parts_count = parts_collected
	
	var end_flag = $Level/EndFlag
	end_flag.position = Vector2(574, 10)  # Set position as needed
	end_flag.show()


func update_ui_counter():
	# Assuming you have a label node named "part_counter_label" in the UI
	#part_counter_label.text = str(parts_collected) + " / 4"
	pass
