extends Node

@onready var arrow =$head/Camera3D/Cube_002/Arrow

var kills = 0
var first_mask = false
var enemy_damage = 10
var reloading = false
var player_health = 50
var player_damage = 10
var arrow_colliding :bool


func add_kill():
	kills += 1
	print("kills :", kills)

func first_world():
	if kills >= 20:
		first_mask = true

func damage_player():
	player_health -= enemy_damage
