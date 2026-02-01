extends Node3D

var enemy_scene = preload("res://scenes/enemy.tscn")
var seconde_enemy_scene = preload("res://scenes/second_world_enemy.tscn")



@onready var s1: Node3D = $spawner
@onready var s2: Node3D = $spawner2
@onready var s3: Node3D = $spawner3
@onready var s4: Node3D = $spawner4
@onready var s5: Node3D = $spawner5
@onready var s6: Node3D = $spawner6
@onready var s7: Node3D = $spawner7
@onready var s8: Node3D = $spawner8
@onready var s9: Node3D = $spawner9
@onready var s10: Node3D = $spawner10
@onready var s11: Node3D = $spawner11
@onready var s12: Node3D = $spawner12
@onready var s13: Node3D = $spawner13

var random_node
var random_enemy

func _on_timer_timeout() -> void:
	random_node = randi_range(0,12)
	random_enemy = randi_range(0,1)
	spawn_zombie()

func spawn_zombie():
	
	var enemy = enemy_scene.instantiate()
	var seconde_enemy = seconde_enemy_scene.instantiate()
	if random_node ==0:
		enemy.position = s1.global_position
		enemy.transform.basis = s1.global_transform.basis
		seconde_enemy.position = s1.global_position
		seconde_enemy.transform.basis =s1.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==1:
		enemy.position = s2.global_position
		enemy.transform.basis = s2.global_transform.basis
		seconde_enemy.position = s2.global_position
		seconde_enemy.transform.basis =s1.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==2:
		enemy.position = s3.global_position
		enemy.transform.basis = s3.global_transform.basis
		seconde_enemy.position = s3.global_position
		seconde_enemy.transform.basis =s3.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==3:
		enemy.position = s4.global_position
		enemy.transform.basis = s4.global_transform.basis
		seconde_enemy.position = s4.global_position
		seconde_enemy.transform.basis =s4.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==4:
		enemy.position = s5.global_position
		enemy.transform.basis = s5.global_transform.basis
		seconde_enemy.position = s5.global_position
		seconde_enemy.transform.basis =s5.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==5:
		enemy.position = s6.global_position
		enemy.transform.basis = s6.global_transform.basis
		seconde_enemy.position = s6.global_position
		seconde_enemy.transform.basis =s6.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==6:
		enemy.position = s7.global_position
		enemy.transform.basis = s7.global_transform.basis
		seconde_enemy.position = s7.global_position
		seconde_enemy.transform.basis =s7.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==7:
		enemy.position = s8.global_position
		enemy.transform.basis = s8.global_transform.basis
		seconde_enemy.position = s8.global_position
		seconde_enemy.transform.basis =s8.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif  random_node ==8:
		enemy.position = s9.global_position
		enemy.transform.basis = s9.global_transform.basis
		seconde_enemy.position = s9.global_position
		seconde_enemy.transform.basis =s9.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==9:
		enemy.position = s10.global_position
		enemy.transform.basis = s10.global_transform.basis
		seconde_enemy.position = s10.global_position
		seconde_enemy.transform.basis =s10.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==10:
		enemy.position = s11.global_position
		enemy.transform.basis = s11.global_transform.basis
		seconde_enemy.position = s11.global_position
		seconde_enemy.transform.basis =s11.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==11:
		enemy.position = s12.global_position
		enemy.transform.basis = s12.global_transform.basis
		seconde_enemy.position = s12.global_position
		seconde_enemy.transform.basis =s12.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
	elif random_node ==12:
		enemy.position = s13.global_position
		enemy.transform.basis = s13.global_transform.basis
		seconde_enemy.position = s13.global_position
		seconde_enemy.transform.basis =s13.global_transform.basis
		if random_enemy == 0:
			get_parent().get_parent().add_child(enemy)
		elif random_enemy == 1:
			get_parent().get_parent().add_child(seconde_enemy)
		elif random_enemy == 2:
			print("enmy missing you cant call it now")
		elif random_enemy ==3:
			print("enemy missing you cant call it now")
		elif random_enemy == 4:
			print("enemy missing you cant call it now")
