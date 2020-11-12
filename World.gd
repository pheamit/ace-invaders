extends Node2D

const DROP_SHIP = preload("res://DropShip.tscn")

const INSTANCE_LIMIT = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	var instance_count = get_tree().get_nodes_in_group("SHIPS").size()
	if event is InputEventMouseButton and event.is_pressed() and instance_count < INSTANCE_LIMIT:
		var instance = DROP_SHIP.instance()
		self.add_child(instance)
		instance.position = event.position
