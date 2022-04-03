extends Area2D

onready var laser = get_parent().get_node("Player/RayCast2D")

var charge : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	print(charge)
	if charge:
		laser.ammo += 1


func _on_Charging_Station_body_entered(body):
	if body.name == "Player":
		charge = true


func _on_Charging_Station_body_exited(body):
	if body.name == "Player":
		charge = false
