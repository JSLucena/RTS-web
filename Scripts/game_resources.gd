extends Node

const BULDING_COUNT_MAX = 5
var SERVER_RATE = 1
var building_preload = preload("res://Scenes/Sprite2Ds/building.tscn")
enum building_index{
	VACANT = 0,
	CITY_HALL = 1,
	FORESTER = 2
}
enum resource_index{
	GOLD = 0,
	WOOD = 1
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
	var level_resources : Dictionary # key is level, then Gold, Wood, etc ....., last  is time
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
	init_building(build_dict["Vacant"],"Vacant")
	init_building(build_dict["City Hall"],"City Hall")
	init_building(build_dict["Forester"],"Forester")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_resources()
	init_buildings()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func init_building(bld_info,bld_name):
	var new_res = Building.new()
	new_res.building_name = bld_name
	new_res.description = bld_info[0]
	new_res.sprite_index  = bld_info[1]
	#new_res.building_menu = bld_info[2]
	new_res.current_level = bld_info[3]
	new_res.level_resources = bld_info[4]
	new_res.effect = bld_info[5]
	available_buildings.append(new_res)

var build_dict = {
	"Vacant" : ["This is a vacant lot, maybe you should build something?", 0, "...", 0, {1 : [0,0,0]}, {0 : 0}],
	
	"City Hall" : ["This is the City Hall, where you can control your population and taxes", 
	1, 
	"...", 
	0,
	{
		1 : [50,50,60],
		2 : [80,60,240],
		3 : [100,100,600]
	},
	{
		1 : {"Max_Population":[100,"a"], "Gold_Production":[1.01,"m"]},
		2 : {"Max_Population":[150,"a"], "Gold_Production":[1.03,"m"]},
		3 : {"Max_Population":[220,"a"], "Gold_Production":[1.05,"m"]}
	}
	],
	
	"Forester" : ["This is the Forester, where you can put citizens to chopp wood", 
	2, 
	"...", 
	0,
	{
		1 : [10,0,12],
		2 : [35,5,24],
		3 : [50,15,40]
	},
	{
		1 : {"Max_Lumberjacks":[5,"i"]},
		2 : {"Max_Lumberjacks":[15,"i"]},
		3 : {"Max_Lumberjacks":[30,"i"]}
	}
	]
	
	}
