extends KinematicBody2D

const speed = 150

onready var raycast = $RayCast2D

var player = null
var HP = 100

func _ready():
	add_to_group("zombies")
	set_player(get_parent().get_node("Player"))

func _physics_process(delta):
	print(HP)
	if player == null:
		return
	var velocity = player.global_position - global_position
	velocity = velocity.normalized()
	global_rotation = atan2(velocity.y,velocity.x)
	move_and_collide(velocity * speed * delta)
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll.name == "Player":
			pass
	
	if HP <= 0 :
		queue_free()

func set_player(p):
	player = p
