extends Node3D

var ray_origin: Vector3 = Vector3()
var ray_target: Vector3 = Vector3()
@onready var player: CharacterBody3D = $Player as CharacterBody3D
@onready var camera: Camera3D = $Camera as Camera3D

func _physics_process( delta: float, ):
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	handle_player_look(mouse_position)
	enemy_movement()
		
func handle_player_look(mouse_position):
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
		
func enemy_movement():
	get_tree().call_group("enemy", "update_target_location", player.global_transform.origin)		
