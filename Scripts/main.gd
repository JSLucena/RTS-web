extends Node2D

var buildings_screen_pos = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_city = gameRes.City.new()
	new_city.city_name = "test"
	new_city.location = Vector2(0,0)
	new_city.population = 50
	for thing in gameRes.available_resources:
		new_city.resource_list[thing.res_name] = thing
	for i in range(0,5):
		#print(gameRes.available_buildings[gameRes.building_index.VACANT].sprite)
		new_city.building_list[i] = gameRes.available_buildings[gameRes.building_index.VACANT]
		buildings_screen_pos[i] = Vector2(0 + 200*(i+1),300)
		var sprite = new_city.building_list[i].sprite.instantiate()
		add_child(sprite)
		sprite.global_position = buildings_screen_pos[i]
		self.add_child((sprite))
		print(sprite)
	
		
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
