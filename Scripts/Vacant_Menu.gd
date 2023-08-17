extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_viewport().size)
	self.size = get_viewport().size - Vector2i(200,200)
	print(self.size)
	for building in gameRes.available_buildings:
		#$Panel/HBoxContainer/buildings.add_item(building.building_name)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_screen_pressed():
	PlayerControl.disable_menus = false
	self.queue_free()
	pass # Replace with function body.
