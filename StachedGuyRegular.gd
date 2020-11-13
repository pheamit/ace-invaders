extends KinematicBody2D

var speed = 100
var gravity = 800
const JUMP_FORCE = 300
var velocity = Vector2()

onready var castle_node = get_parent().get_parent().get_node("World/Background/Castle")
onready var destination = castle_node.position.x

func _ready():
	add_to_group("STACHE_GUYS")

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = 0
	var jump_roll = rand_range(0, 1)
	
	if position.x < destination - 20:
		velocity.x += speed
	elif position.x > destination + 20:
		velocity.x -= speed
	else:
		queue_free()
		
	if jump_roll > 0.96 and is_on_floor():
		velocity.y -= JUMP_FORCE
#		
	velocity = move_and_slide(velocity, Vector2.UP)
