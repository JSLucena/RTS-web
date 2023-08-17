extends Control

#var capital_scene = preload("res://Scenes/main.tscn")
var last_city_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerControl.connect("building_pressed", _building_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _building_pressed():
	PlayerControl.disable_menus = true
	var building_menu = load(gameRes.available_buildings[PlayerControl.selected_building].building_menu).instantiate()
	building_menu.position = Vector2(100,150)
	add_child(building_menu)
func _on_home_pressed():
	if get_tree().get_current_scene().name == "Main":
		#get_tree().set_current_scene(self)
		pass
		#get_tree().change_scene_to_packed(capital_scene)
	pass # Replace with function body.
