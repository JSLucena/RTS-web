extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_viewport().size)
	self.size = get_viewport().size - Vector2i(200,200)
	print(self.size)
	for building in gameRes.available_buildings.keys():
		print(building)
		$Panel/HBoxContainer/buildings.add_item(building,gameRes.load_image(gameRes.available_buildings[building].sprite))
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_screen_pressed():
	PlayerControl.disable_menus = false
	self.queue_free()
	pass # Replace with function body.
