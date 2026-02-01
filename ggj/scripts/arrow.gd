extends Area3D


var speed = 20
var gravit = .5


func _physics_process(delta: float) -> void:
	position += transform.basis * Vector3(0, 0, -speed) * delta
	position.y -= gravit * delta

func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("casual_enemy"):
		Game.arrow_colliding = true
		print("enemy_entered")
	queue_free()
