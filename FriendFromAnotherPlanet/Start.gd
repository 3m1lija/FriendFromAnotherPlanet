extends Button

signal start_game()
@export_file("Level1.tscn") var level1_scene


func _on_pressed() -> void:
	start_game.emit()
	hide()
