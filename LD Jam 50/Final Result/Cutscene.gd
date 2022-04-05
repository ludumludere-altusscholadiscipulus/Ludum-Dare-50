extends Node2D

onready var tween = $Tween
onready var cutscene = $AnimatedSprite
onready var white = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	tween.interpolate_property(white,"modulate",Color(1,1,1,1),Color(1,1,1,0),10,Tween.TRANS_LINEAR,Tween.EASE_OUT_IN)
	tween.start()
	if Final.win:
		cutscene.frame = 1
	yield(get_tree().create_timer(13),"timeout")
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
