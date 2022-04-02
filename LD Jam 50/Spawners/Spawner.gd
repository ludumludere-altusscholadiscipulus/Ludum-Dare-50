extends Position2D

onready var restart = $RestartSpawningTimer
onready var delay = $DelaySpawnTimer
var original_number : int
var number : int

const zombie = preload("res://Enemies/Zombie.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	number = randi() % 3 + 9
	original_number = number
	delay.start()

func _on_RestartSpawningTimer_timeout():
	delay.start()

func _on_DelaySpawnTimer_timeout():
	create_new_child()
	if number <= 0:
		restart.start()
		delay.stop()
		number = original_number

func create_new_child():
	var object = zombie.instance()
	randomize()
	object.position = position + Vector2(rand_range(-10,10),rand_range(-10,10))
	get_parent().add_child(object)
	number -= 1
