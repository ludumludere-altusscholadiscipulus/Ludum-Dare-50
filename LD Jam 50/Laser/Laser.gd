extends RayCast2D

onready var line = $Line2D
onready var cast_particle = $CastingParticles
onready var collide_particle = $CollisionParticles
onready var beam_particle = $BeamParticles

var is_casting := false setget set_is_casting

func _ready():
	set_physics_process(false)
	line.points[1] = Vector2.ZERO

func _unhandled_input(event):
	if event is InputEventMouseButton:
		self.is_casting = event.pressed

func _physics_process(delta : float) -> void:
	var cast_point := cast_to
	force_raycast_update()
	collide_particle.emitting = is_colliding()
	if is_colliding():
		cast_point = to_local(get_collision_point())
		collide_particle.global_rotation = get_collision_normal().angle()
		collide_particle.position = cast_point
		
		var coll = get_collider()
		if coll.is_in_group("zombies"):
			coll.HP -= 1
		
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
	$Tween.interpolate_property(line,"width",0,10.0,0.2)
	$Tween.start()
	
func disappear():
	$Tween.stop_all()
	$Tween.interpolate_property(line,"width",10.0,0,0.1)
	$Tween.start()
