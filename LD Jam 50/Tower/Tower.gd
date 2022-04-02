extends Area2D

var charge_power = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tower_body_entered(body):
	if body.is_in_group("zombies"):
		body.queue_free()
		charge_power += 1
