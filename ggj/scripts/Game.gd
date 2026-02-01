extends Node

var kills = 0
var first_mask = false
var enemy_damage = 10
var reloading = false
var player_health = 50


func add_kill():
	kills += 1
	print("kills :", kills)

func first_world():
	if kills >= 20:
		first_mask = true

func damage_player():
	player_health -= enemy_damage
