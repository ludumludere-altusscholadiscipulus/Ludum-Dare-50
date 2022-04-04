extends CanvasLayer

onready var player = get_parent().get_node("Player")
onready var laser = get_parent().get_node("Player/RayCast2D")
onready var tower = get_parent().get_node("Tower")
onready var bar = $ProgressBar
onready var laser_bar = $ProgressBar2
onready var tower_bar = $ProgressBar3
onready var animation = $AnimationPlayer
onready var text = $Label

func _ready():
	pass # Replace with function body.

func _process(delta):
	bar.value = player.HP
	laser_bar.value = laser.ammo
	tower_bar.value = tower.charge_power

func percentage_25():
	text.text = "25% repaired! Keep it up!"
	animation.play("typewriter")
	yield(get_tree().create_timer(4),"timeout")
	text.text = ""
func percentage_50():
	text.text = "50% repaired! We're close!"
	animation.play("typewriter")
	yield(get_tree().create_timer(4),"timeout")
	text.text = ""
func percentage_75():
	text.text = "75% repaired! Just hold on a little longer!"
	animation.play("typewriter")
	yield(get_tree().create_timer(4),"timeout")
	text.text = ""
func percentage_100():
	text.text = "Rocket is fully repaired! Return to lift off!"
	animation.play("typewriter")
	yield(get_tree().create_timer(4),"timeout")
	text.text = ""
