extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	for building in gameRes.available_buildings:
		$Panel/HBoxContainer/buildings.add_item(building.building_name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
