extends CharacterBody3D

@onready var collision_shape: CollisionShape3D = $CollisionShape3D

var health = 200
var gravity = 9
var speed = 1
var dir = 0
var first_mask : bool

func _physics_process(_delta: float) -> void:
	visibility(Game.first_mask)
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
	move_and_slide()


func _on_timer_timeout() -> void:
	dir = randi_range(0,9)
	print(health)

func first_world_enemy_hit(damage):
	health -= damage
	if health <= 0:
		Game.add_kill()
		queue_free()

func visibility(first_mask):
	if first_mask == true:
		visible = true
		collision_shape.disabled = false
	else:
		visible = false
		collision_shape.disabled = true
