extends Area2D

var type = "Vacant"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	for building in gameRes.available_buildings:
		print(building.building_name)
		if building.building_name == type:
			print(building.description)
			break
	
