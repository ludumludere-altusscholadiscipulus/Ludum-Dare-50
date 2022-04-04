extends Position2D

onready var restart = $RestartSpawningTimer
onready var delay = $DelaySpawnTimer
var original_number : int
var number : int

const zombie = preload("res://Enemies/Zombie.tscn")

func _ready():
	randomize()
	number = randi() % 3 + 2
	delay.start()

func _on_RestartSpawningTimer_timeout():
	delay.start()

func _on_DelaySpawnTimer_timeout():
	create_new_child()
	if number <= 0:
		randomize()
		if get_parent().check1:
			number = randi() % 3 + 4
		if get_parent().check2:
			number = randi() % 3 + 6
		if get_parent().check3:
			number = randi() % 3 + 8
		if get_parent().check4:
			number = 10
		restart.wait_time = randi() % 3 + 10
		restart.start()
		delay.stop()

func create_new_child():
	var object = zombie.instance()
	randomize()
	object.position = position + Vector2(rand_range(-10,10),rand_range(-10,10))
	get_parent().add_child(object)
	number -= 1
