extends Node3D

@export var Bullet: PackedScene
@export var muzzle_speed: int = 30
@export var millis_between_shots: float = 100.0

@onready var rof_timer: Timer = $Timer
@onready var muzzle: Marker3D = $Muzzle
var can_shoot: bool = true


func _ready() -> void:
	rof_timer.wait_time = millis_between_shots / 1000.0

#func _process(delta):
#	shoot()
	
func shoot():
	if can_shoot:
		var new_bullet: Node3D = Bullet.instantiate()
		new_bullet.global_transform = muzzle.global_transform
		new_bullet.speed = muzzle_speed
		var scene_root: Node = get_tree().get_root().get_children()[0]
		scene_root.add_child(new_bullet)
		can_shoot = false
		rof_timer.start()


func _on_timer_timeout():
	can_shoot = true
