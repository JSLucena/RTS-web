extends Area2D

var type = "Vacant"
signal clicked(area: Area2D)
# Called when the node enters the scene tree for the first time.
func _ready():
	change_sprite()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

func change_sprite():
	print(gameRes.available_buildings[type])
	$sprite.texture = gameRes.load_image(gameRes.available_buildings[type].sprite)
	$sprite.apply_scale(Vector2(8,8))
	
	

# From here on Im trying to detect which space the player is hovering, and where does he click
func _on_mouse_entered():
	if PlayerControl.disable_menus == false:
		print(gameRes.available_buildings[type].description)
		PlayerControl.selected_space = self.name
		PlayerControl.selected_building = self.type
	pass # Replace with function body.

func _on_mouse_exited(): #if he is not hovering anything we discard the selected space
	PlayerControl.selected_space = null
	PlayerControl.selected_building = null
	pass # Replace with function body.
