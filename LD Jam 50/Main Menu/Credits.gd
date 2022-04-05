extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_TextureButton3_pressed():
	get_parent().credits_shown = false
	self.visible = false
