extends Node2D

onready var player = $Player
onready var tower = $Tower
onready var timer = $RepairTimer
onready var canvas = $CanvasLayer

var check1 : bool = false
var check2 : bool = false
var check3 : bool = false
var check4 : bool = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if player.HP <= 0 or tower.charge_power >= 80: #LOSE SCRIPT
		Final.win = false
		get_tree().change_scene("res://Final Result/Cutscene.tscn")
		
	if $"Charging Station/StaticBody2D/CollisionShape2D".disabled and $"Charging Station".charge: # WIN CONDITION
		Final.win = true
		get_tree().change_scene("res://Final Result/Cutscene.tscn")
		
	if timer.time_left <= 135 and !check1:
		check1 = true
		canvas.percentage_25()
	if timer.time_left <= 90 and !check2:
		check2 = true
		canvas.percentage_50()
	if timer.time_left <= 45 and !check3:
		check3 = true
		canvas.percentage_75()

func _on_RepairTimer_timeout():
	check4 = true
