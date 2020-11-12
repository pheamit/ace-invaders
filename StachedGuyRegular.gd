extends KinematicBody2D

var speed = 200
var gravity = 800
const JUMP_FORCE = 300
var velocity = Vector2()
onready var castle_node = get_node("/root/Castle.tscn")

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = 0
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	elif Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= JUMP_FORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
