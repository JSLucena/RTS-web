extends Node2D
var parent
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	#$Main_HUD/HBoxContainer/GoldQuantity.text = parent.new_city.resource_list["Gold"].quantity
	#$Main_HUD/HBoxContainer/WoodQuantity.text = parent.new_city.resource_list["Wood"].quantity
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_refresh_timeout():
	#print(PlayerControl.city_list[parent.this_city.city_name].resource_list)
	$Main_HUD/VBoxContainer/stats/GoldQuantity.text = "%.f" % PlayerControl.city_list[parent.this_city.city_name].resource_list["Gold"].quantity
	$Main_HUD/VBoxContainer/stats/WoodQuantity.text = "%.f" % PlayerControl.city_list[parent.this_city.city_name].resource_list["Wood"].quantity
	$Main_HUD/VBoxContainer/stats/PopQuantity.text = str(PlayerControl.city_list[parent.this_city.city_name].population) + "/" + str(PlayerControl.city_list[parent.this_city.city_name].max_population)
	
