extends Node3D

var ray_origin: Vector3 = Vector3()
var ray_target: Vector3 = Vector3()
var camera: Camera3D
var player: CharacterBody3D

func _ready():
	camera = $Camera
	player = $Player

func _physics_process( delta: float, ):
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_origin = camera.project_ray_origin(mouse_position)
	ray_target = camera.project_ray_normal(mouse_position) * 20000
	var space_state = get_world_3d().direct_space_state
	var ray_params = PhysicsRayQueryParameters3D.create(ray_origin, ray_target)
	ray_params.collide_with_areas = true
	var intersection = space_state.intersect_ray(ray_params)
	
	if not intersection.is_empty():
		var pos: Vector3 = intersection.position
		var look_at_me = Vector3(pos.x, player.position.y ,pos.z)
		player.look_at(look_at_me, Vector3.UP, true)
