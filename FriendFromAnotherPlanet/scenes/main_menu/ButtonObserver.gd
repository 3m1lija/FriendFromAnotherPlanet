class_name ButtonObserver

extends Observer

var button_name : String


func _init(name):
	button_name = name


func update(event):
	# Business logic for play button press
	print(button_name, "button pressed with event: ", event)
