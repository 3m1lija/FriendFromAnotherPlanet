extends TabBar

var master_bus = AudioServer.get_bus_index("Master")
var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")


func _ready():
	%Master.value = Persistence.config.get_value("Audio", '0')
	AudioServer.set_bus_volume_db(master_bus, linear_to_db(%Master.value))

	%Music.value = Persistence.config.get_value("Audio", '1')
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(%Music.value))
	
	%SFX.value = Persistence.config.get_value("Audio", '2')
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(%SFX.value))

	#var sound_index = Persistence.config.get_value("Audio", "sound")
	#AudioServer.set_bus_mute(master_bus, sound_index)
	#AudioServer.set_bus_mute(music_bus, sound_index)


func _on_master_value_changed(value):
	set_volume(master_bus, value)


func _on_music_value_changed(value):
	set_volume(music_bus, value)


func _on_sfx_value_changed(value):
	set_volume(sfx_bus, value)


#func _on_sound_toggled(toggled_on):
	#if toggled_on:
		#AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))
		#AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
		#Persistence.config.set_value("Audio", "master", not AudioServer.is_bus_mute(master_bus))
		#Persistence.config.set_value("Audio", "music", not AudioServer.is_bus_mute(music_bus))
		#Persistence.save_data()


func set_volume(idx, value):
	AudioServer.set_bus_volume_db(idx, linear_to_db(value))
	Persistence.config.set_value("Audio", str(idx), value)
	Persistence.save_data()
