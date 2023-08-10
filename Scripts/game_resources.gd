extends Node

const BULDING_COUNT_MAX = 5

enum building_index{
	VACANT = 0,
	CITY_HALL = 1
}
enum resource_index{
	GOLD = 0,
	WOOD = 1
}
var building_sprite_dictionary = {
	0 : preload("res://Scenes/Sprite2Ds/Vacant_Space.tscn"),
	1 : preload("res://Scenes/Sprite2Ds/City_Hall.tscn")
}
var resource_sprite_dictionary = {
	0 : preload("res://Scenes/Sprite2Ds/Gold.tscn"),
	1 : preload("res://Scenes/Sprite2Ds/Wood.tscn")
}


class Game_Resource:
	var res_name : String
	var quantity : float
	var production : float
	var sprite_index : int

class Building:
	var building_name : String
	var description : String
	var sprite_index : int
	var building_menu : Node2D
	var current_level : int
	var level_time : Dictionary
	var effect : Dictionary
	
	
class City:
	var city_name : String
	var location : Vector2
	var population : int
	var max_population : int
	var resource_list : Dictionary
	var building_list : Dictionary
	var modifiers : Dictionary


var available_resources = []
var available_buildings = []


func init_resources(): # initializes available resources
	var new_res = Game_Resource.new()
	new_res.res_name = "Gold"
	new_res.quantity = 50
	new_res.production = 0
	new_res.sprite_index  = 0
	available_resources.append(new_res)
	new_res = Game_Resource.new()
	new_res.res_name = "Wood"
	new_res.quantity = 100
	new_res.production = 0
	new_res.sprite_index  = 1
	available_resources.append(new_res)
	print(available_resources)

func init_buildings():
	var new_res = Building.new()
	new_res.building_name = "Vacant"
	new_res.description = "This is a vacant lot, maybe you should build something?"
	new_res.sprite_index  = 0
	#new_res.building_menu = ...
	new_res.current_level = 0
	available_buildings.append(new_res)
	
	new_res.building_name = "City Hall"
	new_res.description = "This is the City Hall, where you can control your population and taxes"
	new_res.sprite_index  = 1
	#new_res.building_menu = ...
	new_res.current_level = 1
	#new_res.level_time = {}
	new_res.effect[1] = {"Max_Population":[100,"a"], "Gold_Production":[1.01,"m"]}
	
	available_buildings.append(new_res)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_resources()
	init_buildings()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
