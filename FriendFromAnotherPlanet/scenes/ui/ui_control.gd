class_name UI_Control

extends Control

@export var parts_collected_label : Label = null

signal part_collected(value : int)


func emit_on_part_collected(value : int) -> void:
	parts_collected_label.text = str(Global.collected_parts_count) + " / 4"
