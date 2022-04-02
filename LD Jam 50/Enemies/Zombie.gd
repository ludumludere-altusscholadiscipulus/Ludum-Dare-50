extends KinematicBody2D

const speed = 150

onready var raycast = $RayCast2D

var player = null
var tower = null
var HP = 100
var velocity : Vector2

func _ready():
	add_to_group("zombies")
	set_player(get_parent().get_node("Player"))
	set_tower(get_parent().get_node("Tower"))

func _physics_process(delta):
	print(HP)
	if player == null:
		return
	var distance_to_player = global_position.distance_to(player.global_position)
	var distance_to_tower = global_position.distance_to(tower.global_position)
	
	if distance_to_player > distance_to_tower:
		velocity = tower.global_position - global_position
	else:
		velocity = player.global_position - global_position

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

func set_tower(p):
	tower = p
