extends Node

@export var StartingWeapon: PackedScene
var hand: Marker3D
var equiped_weapon: Node3D

func _ready():
	hand = get_parent().find_child("Hand", true)
	if StartingWeapon:
		equip_weapon(StartingWeapon.instantiate())
		
func equip_weapon(weapon_to_equip):
	if equiped_weapon:
		equiped_weapon.queue_free()
	else:
		equiped_weapon = weapon_to_equip
		hand.add_child(equiped_weapon)
		
func shoot():
	if equiped_weapon:
		equiped_weapon.shoot()
