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
	$Main_HUD/HBoxContainer/GoldQuantity.text = str(parent.new_city.resource_list["Gold"].quantity)
	$Main_HUD/HBoxContainer/WoodQuantity.text = str(parent.new_city.resource_list["Wood"].quantity)
	pass # Replace with function body.