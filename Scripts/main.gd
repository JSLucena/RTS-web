extends Node2D

var buildings_screen_pos = {}
var this_city = gameRes.City.new()
var modded
# Called when the node enters the scene tree for the first time.


func apply_modifier(key, stat, building):
#	print(building.effect[building.current_level])
	if building.effect[building.current_level][key][1] == "a":
		return stat + building.effect[building.current_level][key][0]
	else:
		return stat * building.effect[building.current_level][key][0]
func _ready():
	if PlayerControl.city_list.is_empty():
		this_city.city_name = "test"
		this_city.location = Vector2(0,0)
		this_city.population = 50
		this_city.max_population = 50
		for thing in gameRes.available_resources:
			print(thing.res_name)
			this_city.resource_list[thing.res_name] = thing
		for i in range(0,5):
			var name = "space" + str(i)
			this_city.building_list[i] = [gameRes.available_buildings[gameRes.building_index.VACANT],get_node(name)]
		
		this_city.resource_list["Gold"].production = this_city.population * 0.1
		#creating city hall
		var new_building = gameRes.building_preload.instantiate()
		new_building.type = "City Hall"
		new_building.modulate = Color(1.0, 1.0, 0, 1.0)
		new_building.scale = Vector2(2,2)
		
		new_building.position = $space0.position
		new_building.name = $space0.name
		$space0.queue_free()
		remove_child($space0)
		add_child(new_building)

		this_city.building_list[0] = [gameRes.available_buildings[gameRes.building_index.CITY_HALL],get_node("space0")]
		modded = this_city
		print(this_city.building_list[0][0].building_name)
		this_city.building_list[0][0].current_level = 1
		modded.max_population = apply_modifier("Max_Population",modded.max_population, this_city.building_list[0][0])
		print(modded.max_population)
		modded.resource_list["Gold"].production = apply_modifier("Gold_Production",modded.resource_list["Gold"].production, this_city.building_list[0][0])
		PlayerControl.city_list.append(this_city)
	else :
		pass
	






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_refresh_timeout():
	modded.resource_list["Gold"].quantity = modded.resource_list["Gold"].quantity + modded.resource_list["Gold"].production
	pass # Replace with function body.
