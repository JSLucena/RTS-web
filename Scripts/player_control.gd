extends Node

var city_list = {}
var last_city_looked

signal building_pressed
var selected_space
var selected_building
var disable_menus : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if selected_space != null and not disable_menus:
			emit_signal("building_pressed")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
