extends Node

const BULDING_COUNT_MAX = 5

enum building_index{
	VACANT = 0
}

class Game_Resource:
	var res_name : String
	var quantity : int
	var production : float
	var sprite : PackedScene

class Building:
	var building_name : String
	var description : String
	var sprite : PackedScene
	var building_menu : Node2D
	var current_level : int
	var level_time : Dictionary
	
	
class City:
	var city_name : String
	var location : Vector2
	var population : int
	var resource_list : Dictionary
	var building_list : Dictionary


var available_resources = []
var available_buildings = []


func init_resources(): # initializes available resources
	var new_res = Game_Resource.new()
	new_res.res_name = "Gold"
	new_res.quantity = 100
	new_res.production = 0
	new_res.sprite = preload("res://Scenes/Sprite2Ds/Gold.tscn").instantiate()
	available_resources.append(new_res)
	new_res.res_name = "Wood"
	new_res.quantity = 100
	new_res.production = 0
	new_res.sprite = preload("res://Scenes/Sprite2Ds/Wood.tscn").instantiate()
	available_resources.append(new_res)

func init_buildings():
	var new_res = Building.new()
	new_res.building_name = "Vacant"
	new_res.description = "This is a vacant lot, maybe you should build something?"
	new_res.sprite = preload("res://Scenes/Sprite2Ds/Vacant_Space.tscn")
	#new_res.building_menu = ...
	new_res.current_level = 0
	available_buildings.append(new_res)
# Called when the node enters the scene tree for the first time.
func _ready():
	init_resources()
	init_buildings()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
