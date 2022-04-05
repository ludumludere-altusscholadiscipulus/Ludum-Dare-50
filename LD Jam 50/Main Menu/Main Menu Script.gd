extends Node2D

var credits_shown : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed(): #PlayGame
	if !credits_shown:
		get_tree().change_scene("res://Game.tscn")

func _on_TextureButton2_pressed():
	credits_shown = true
	$Credits.visible = true
