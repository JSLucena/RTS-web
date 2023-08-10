extends Node2D

var buildings_screen_pos = {}
var new_city = gameRes.City.new()
# Called when the node enters the scene tree for the first time.


func _ready():
	new_city.city_name = "test"
	new_city.location = Vector2(0,0)
	new_city.population = 50
	for thing in gameRes.available_resources:
		print(thing.res_name)
		new_city.resource_list[thing.res_name] = thing
	for i in range(0,5):
		var name = "space" + str(i)
		new_city.building_list[i] = [gameRes.available_buildings[gameRes.building_index.VACANT],get_node(name)]
	
	var new_building = gameRes.building_sprite_dictionary[gameRes.building_index.CITY_HALL].instantiate()
	new_building.position = $space0.position
	new_building.name = $space0.name
	$space0.queue_free()
	add_child(new_building)
	new_city.building_list[0] = [gameRes.available_buildings[gameRes.building_index.CITY_HALL],get_node("space0")]







# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_refresh_timeout():
	
	pass # Replace with function body.
