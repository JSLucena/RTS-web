extends Node

var city_list = {}
var last_city_looked


var selected_space

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		print(selected_space)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
