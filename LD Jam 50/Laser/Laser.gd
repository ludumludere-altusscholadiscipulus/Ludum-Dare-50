extends RayCast2D

onready var line = $Line2D
onready var cast_particle = $CastingParticles
onready var collide_particle = $CollisionParticles
onready var beam_particle = $BeamParticles

onready var camera = get_parent().get_node("Camera2D")

var is_casting := false setget set_is_casting
var ammo = 1000
var shoot : bool = true

const sfx_start = preload("res://SFX/StartShoot.wav")
const sfx_shoot = preload("res://SFX/Shoot.wav")
const sfx_stop = preload("res://SFX/End.wav")

func _ready():
	set_physics_process(false)
	line.points[1] = Vector2.ZERO

func _unhandled_input(event):
	if shoot:
		if ammo > 0:
			if event.is_action_pressed("shoot"):
				self.is_casting = true
				camera.shake(0.1,100,10)
			if event.is_action_released("shoot"):
				self.is_casting = false
		else:
			if is_casting:
				self.is_casting = false
	else:
		if is_casting:
			self.is_casting = false

func _physics_process(delta : float) -> void:
	if ammo >= 1000:
		ammo = 1000
	if ammo <= 0:
		ammo = 0
		
	var cast_point := cast_to
	force_raycast_update()
	collide_particle.emitting = is_colliding()
	
	if is_casting:
		ammo -= 1
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		collide_particle.global_rotation = get_collision_normal().angle()
		collide_particle.position = cast_point
		
		var coll = get_collider()
		if coll.is_in_group("zombies"):
			coll.HP -= 2
		
	line.points[1] = cast_point
	beam_particle.position = cast_point * 0.5
	beam_particle.process_material.emission_box_extents.x = cast_point.length() * 0.5

func set_is_casting(cast : bool) -> void:
	is_casting = cast
	
	beam_particle.emitting = is_casting
	cast_particle.emitting = is_casting
	if is_casting:
		appear()
	else:
		collide_particle.emitting = false
		disappear()
	set_physics_process(is_casting)

func appear():
	$Tween.stop_all()
	$AudioStreamPlayer2D.stream = sfx_start
	$AudioStreamPlayer2D.play()
	$Tween.interpolate_property(line,"width",0,10.0,0.1)
	$Tween.start()
	
func disappear():
	$Tween.stop_all()
	$AudioStreamPlayer2D.stream = sfx_stop
	$AudioStreamPlayer2D.play()
	$Tween.interpolate_property(line,"width",10.0,0,0.1)
	$Tween.start()


func _on_AudioStreamPlayer2D_finished():
	if $AudioStreamPlayer2D.stream == sfx_start:
		$AudioStreamPlayer2D.stream = sfx_shoot
		$AudioStreamPlayer2D.play()
