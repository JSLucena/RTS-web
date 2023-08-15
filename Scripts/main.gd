extends Node2D

var buildings_screen_pos = {}
var this_city = gameRes.City.new()
var modded
var this_city_id
# Called when the node enters the scene tree for the first time.


func apply_modifier(key, stat, building):
#	print(building.effect[building.current_level])
	if building.effect[building.current_level][key][1] == "a":
		return stat + building.effect[building.current_level][key][0]
	else:
		return stat * building.effect[building.current_level][key][0]
func _ready():
	if PlayerControl.city_list.is_empty(): #Creating a sample city
		this_city.city_name = "test"
		this_city.location = Vector2(0,0)
		this_city.population = 50
		this_city.max_population = 50
		for thing in gameRes.available_resources: #add avaliable resources to city resource list
			this_city.resource_list[thing.res_name] = thing
		for i in range(0,5): #add 5 spaces to the building_list
			var name = "space" + str(i)
			this_city.building_list[i] = [gameRes.available_buildings["Vacant"],get_node(name).position,name]
		
		this_city.resource_list["Gold"].production = this_city.population * 0.1
		
		#creating city hall
		var new_building = gameRes.building_preload.instantiate()
		new_building.type = "City Hall"
		new_building.position = $space0.position
		new_building.name = $space0.name
		$space0.queue_free()
		remove_child($space0)
		add_child(new_building)

		this_city.building_list[0] = [gameRes.available_buildings["City Hall"],get_node("space0").position, "space0"]
		#print(this_city.building_list[0][0].building_name)
		this_city.building_list[0][0].current_level = 1
		this_city.max_population = apply_modifier("Max_Population",this_city.max_population, this_city.building_list[0][0]) #
		#print(this_city.max_population)
		this_city.resource_list["Gold"].production = apply_modifier("Gold_Production",this_city.resource_list["Gold"].production, this_city.building_list[0][0])
		PlayerControl.city_list[this_city.city_name] = this_city
		PlayerControl.last_city_looked = this_city.city_name
	else :
		this_city.city_name = PlayerControl.last_city_looked
		for i in PlayerControl.city_list[this_city.city_name].building_list:
			#if building[0] == gameRes.available_buildings[gameRes.building_index.CITY_HALL]:
			print(i)
			var new_building = gameRes.building_preload.instantiate()
			new_building.type = PlayerControl.city_list[this_city.city_name].building_list[i][0].building_name
			new_building.position = PlayerControl.city_list[this_city.city_name].building_list[i][1]
			new_building.name = PlayerControl.city_list[this_city.city_name].building_list[i][2]
			#PlayerControl.city_list[this_city.city_name].building_list[i][1].queue_free()
			
			remove_child(get_node(PlayerControl.city_list[this_city.city_name].building_list[i][2]))
			add_child(new_building)
			new_building.queue_free()
			
		pass
	






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_refresh_timeout():
	PlayerControl.city_list[this_city.city_name].resource_list["Gold"].quantity = PlayerControl.city_list[this_city.city_name].resource_list["Gold"].quantity + PlayerControl.city_list[this_city.city_name].resource_list["Gold"].production
	pass # Replace with function body.
