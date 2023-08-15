extends Control

var capital_scene = preload("res://Scenes/main.tscn")
var last_city_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_home_pressed():
	if get_tree().get_current_scene().name == capital_scene.instantiate().name:
		get_tree().set_current_scene(self)
		#get_tree().change_scene_to_packed(capital_scene)
	pass # Replace with function body.
