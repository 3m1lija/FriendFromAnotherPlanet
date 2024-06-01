class_name EventManager

extends Node

var listeners = {}


func subscribe(event_type, listener):
	if event_type not in listeners:
		listeners[event_type] = []
	listeners[event_type].append(listener)


func unsubscribe(event_type, listener):
	if event_type in listeners:
		listeners[event_type].erase(listener)


func notify(event_type, data):
	if event_type in listeners:
		for listener in listeners[event_type]:
			listener.update(data)
