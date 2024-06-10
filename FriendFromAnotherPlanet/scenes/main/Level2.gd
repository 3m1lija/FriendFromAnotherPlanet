class_name Level2

extends Node2D

var part_counter_label


# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui_counter()
	
	var robot_part = $Entity/RobotPart
	# Connect the part_picked_up signal to the spawn_new_area method
	robot_part.connect("part_picked_up", show_end_flag)
	
	part_counter_label = $Label
	
	# Initially hide the end flag
	$Level/EndFlag.hide()


# Function to spawn the new area (EndFlag)
func show_end_flag():
	# Store the collected parts count for the next level
	Global.collected_parts_count +=1
	
	update_ui_counter()
	
	var end_flag = $Level/EndFlag
	end_flag.position = Vector2(574, 10)  # Set position as needed
	end_flag.show()


func update_ui_counter():
	# Assuming you have a label node named "part_counter_label" in the UI
	var ui_control = $UILayer/UI_Control
	ui_control.emit_on_part_collected(Global.collected_parts_count)
	#part_counter_label.text = str(Global.collected_parts_count) + " / 4"
	pass
