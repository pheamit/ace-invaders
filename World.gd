extends Node2D

const DROP_SHIP = preload("res://DropShip.tscn")

const INSTANCE_LIMIT = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	var instance_count = get_tree().get_nodes_in_group("SHIPS").size()
	if event is InputEventMouseButton and event.is_pressed() and instance_count < INSTANCE_LIMIT:
		var instance = DROP_SHIP.instance()
		self.add_child(instance)
		instance.position = event.position



func _on_Restart_pressed():
	get_node("Fun/StacheGuyCounter").set_text("0")
	var dropships = get_tree().get_nodes_in_group("SHIPS")
	for n in dropships.size():
		dropships[n].queue_free()
	var stacheguys = get_tree().get_nodes_in_group("STACHE_GUYS")
	for n in stacheguys.size():
		stacheguys[n].queue_free()


func _on_Control_gui_input(event):
	get_tree().set_input_as_handled()
