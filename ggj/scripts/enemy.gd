extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D = %player



var health = 100
var gravity = 9
var speed = 1
var dir
var player_entered = false

func _physics_process(_delta: float) -> void:
	if player_entered == false:
		if not is_on_floor():
			velocity.y -= gravity
			pass
		if dir == 1:
			velocity.x = speed
		if dir == 2:
			velocity.x = -speed
		if dir == 3:
			velocity.z = speed
		if dir == 4:
			velocity.z = -speed
		if dir == 5:
			velocity.x = speed
			velocity.z = speed
		if dir == 6:
			velocity.x = -speed
			velocity.z = -speed
		if dir == 7:
			velocity.x = speed
			velocity.z = -speed
		if dir == 8:
			velocity.x = -speed
			velocity.z = speed
		if dir == 9:
			velocity.x = 0
			velocity.z = 0
	elif player_entered == true:
		dir = to_local(navigation_agent_3d.get_next_path_position()).normalized()
		velocity = dir * speed
	move_and_slide()

func make_path():
	navigation_agent_3d.target_position = player.global_position


func _on_timer_timeout() -> void:
	dir = randi_range(0,9)
	print(health)

func casual_enemy_hit(damage):
	health -= damage
	if health <= 0:
		Game.add_kill()
		queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_entered = true
	else :
		player_entered = false
	pass # Replace with function body.
