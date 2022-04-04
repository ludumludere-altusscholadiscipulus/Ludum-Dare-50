extends Area2D

onready var laser = get_parent().get_node("Player/RayCast2D")

onready var barrier = $StaticBody2D/CollisionShape2D

var charge : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if charge:
		laser.ammo += 10
	
	if get_parent().check4:
		barrier.disabled = true


func _on_Charging_Station_body_entered(body):
	if body.name == "Player":
		charge = true
		laser.shoot = false


func _on_Charging_Station_body_exited(body):
	if body.name == "Player":
		charge = false
		laser.shoot = true
