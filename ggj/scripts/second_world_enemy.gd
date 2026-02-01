extends CharacterBody3D

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D = %player

var health = 100
var gravity = 20
var speed = 1

var wander_dir: int = 9
var move_dir: Vector3 = Vector3.ZERO
var player_entered := false


func _physics_process(delta: float) -> void:
	# gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	velocity.x = 0
	velocity.z = 0

	if not player_entered:
		wander()
	else:
		chase_player()

	move_and_slide()


func wander():
	match wander_dir:
		1: velocity.x = speed
		2: velocity.x = -speed
		3: velocity.z = speed
		4: velocity.z = -speed
		5: velocity = Vector3(speed, velocity.y, speed)
		6: velocity = Vector3(-speed, velocity.y, -speed)
		7: velocity = Vector3(speed, velocity.y, -speed)
		8: velocity = Vector3(-speed, velocity.y, speed)
		9: pass



func chase_player():
	if navigation_agent.is_navigation_finished():
		return

	var next_pos = navigation_agent.get_next_path_position()
	move_dir = (next_pos - global_position).normalized()
	velocity.x = move_dir.x * speed
	velocity.z = move_dir.z * speed
	


func make_path():
	if player:
		navigation_agent.target_position = player.global_position


func _on_timer_timeout() -> void:
	wander_dir = randi_range(1, 9)
	#print("Health:", health)


func casual_enemy_hit(damage):
	health -= damage
	if health <= 0:
		Game.add_kill()
		queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		make_path()


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		Game.reloading = true
