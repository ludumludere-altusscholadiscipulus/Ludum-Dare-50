extends CanvasLayer

onready var player = get_parent().get_node("Player")
onready var laser = get_parent().get_node("Player/RayCast2D")
onready var tower = get_parent().get_node("Tower")
onready var bar = $ProgressBar
onready var laser_bar = $ProgressBar2
onready var tower_bar = $ProgressBar3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	bar.value = player.HP
	laser_bar.value = laser.ammo
	tower_bar.value = tower.charge_power
