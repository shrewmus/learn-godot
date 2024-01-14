extends CharacterBody3D

@onready var gun_controller = $GunController

var speed: float = 8.1

func _process( delta):
	velocity = Vector3()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.z -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.z += 1
		
	velocity = velocity.normalized() * speed	

	move_and_slide()
	
	if Input.is_action_pressed("primary_action"):
		gun_controller.shoot()
