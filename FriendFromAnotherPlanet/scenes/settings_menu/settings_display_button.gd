extends Control


@onready var option_button = $HBoxContainer/OptionButton as OptionButton


const DISPLAY_TYPE_ARRAY : Array[String] = [
	"Windowed",		#value - 0
	"Fullscreen"	#value - 1
]


func _ready():
	#select from dropdown menu and give signal to index value
	add_display_type_items()
	option_button.item_selected.connect(on_display_type_selected)
	load_data()


func load_data() -> void:
	on_display_type_selected(SettingsDataContainer.get_display_type_index())
	option_button.select(SettingsDataContainer.get_display_type_index())


func add_display_type_items() -> void:
	for display_type in DISPLAY_TYPE_ARRAY:
		option_button.add_item(display_type)


func on_display_type_selected(index : int) -> void:
	SettingsManager.emit_on_display_type_selected(index)
	match index:
		0: #Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
