extends KinematicBody2D

export (int) var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	rotation = get_global_mouse_position().angle_to_point(position)
	get_input()
	velocity = move_and_slide(velocity)

