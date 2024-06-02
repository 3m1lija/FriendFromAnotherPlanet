# Observable subject
class_name MainMenuObserver

extends Node

var observers = {}


func subscribe(event, observer):
	if event in observers:
		observers[event].append(observer)
	else:
		observers[event] = [observer]


func unsubscribe(event, observer):
	if event in observers:
		var index = observers[event].find(observer)
		if index != -1:
			observers[event].remove_at(index)


func notify(event):
	if event in observers:
		for observer in observers[event]:
			observer.update(event)
