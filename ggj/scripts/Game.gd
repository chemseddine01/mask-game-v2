extends Node

var kills = 0
var first_mask = false


func add_kill():
	kills += 1
	print("kills :", kills)

func first_world():
	if kills >= 2:
		first_mask = true 
