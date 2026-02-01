extends CharacterBody3D

## إعدادات الحركة الأساسية
@export var walk_speed: float = 200.0
@export var sprint_speed: float = 350.0
@export var jump_velocity: float = 4.5
@export var mouse_sensitivity: float = 0.1




# scenes
var lose_scene = ("res://scenes/lose_scene.tscn")
var arrow_scene = preload("res://scenes/arrow.tscn")
# animation players
@onready var animation_player: AnimationPlayer = $head/Camera3D/AnimationPlayer



## إعدادات Head Bobbing
@export var bob_frequency: float = 2.0        # تردد الاهتزاز
@export var bob_amplitude: float = 0.08   # مدى الاهتزاز
var bob_time: float = 0.0
## === Sway Var ===
var Sway_mode = null
var Sway_speed = 10
var target_sway := 0.0
## إعدادات الكاميرا
@export var base_fov: float = 75.0
@export var fov_change: float = 1.5



# kill settings
var kill_amount = Game.kills


# ray settings
@onready var ray: RayCast3D = $head/Camera3D/RayCast3D


@onready var head: Node3D = $head
@onready var camera: Camera3D = $head/Camera3D
@onready var initial_camera_pos: Vector3 = camera.position
var damage = 10
var double_jump = 1
var current_speed: float = walk_speed
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# تحريك الكاميرا بالماوس
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		camera.rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity))
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta):
	if Game.player_health == 0:
#		get_tree().change_scene_to_file(lose_scene)
		pass
	$CanvasLayer/Control/Label2.text = "walk_speed "+ str(sprint_speed) 
	# الجاذبية
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		animation_player.play("Fire")
	if not Input.is_anything_pressed():
		animation_player.play("Idle")
	first_world()
# يصفر مكانه جوه الإيد
	
	# القفز
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_pressed("shift") and Input.is_action_pressed("forward"):
		animation_player.play("Move")
	
	
	# الجري
	current_speed = sprint_speed if Input.is_action_pressed("shift") else walk_speed
	
	
	# الحركة
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized() * delta
	
	if is_on_floor():
		if direction:
			velocity.x = direction.x * current_speed
			velocity.z = direction.z * current_speed
		else:
			# إبطاء الحركة عند التوقف
			velocity.x = move_toward(velocity.x, 0, current_speed)
			velocity.z = move_toward(velocity.z, 0, current_speed)
	else:
		# حركة الهواء
		velocity.x = lerp(velocity.x, direction.x * current_speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * current_speed, delta * 3.0)


	# تطبيق تأثير Head Bobbing
	_apply_head_bob(delta)
	
	# تغيير مجال الرؤية (FOV) أثناء الجري
	_update_fov(delta)
	
	move_and_slide()

	## ==== Sway ====

	if Input.is_action_pressed("left"):
		target_sway = 0.05
		Sway_mode = "Left"

	elif Input.is_action_pressed("right"):
		target_sway = -0.05
		Sway_mode = "Right"

	else:
		target_sway = 0.0
		Sway_mode = null
	## Smooth movement toward target
	$head/Camera3D.rotation.z = lerp($head/Camera3D.rotation.z, target_sway , Sway_speed * delta)
	
func _apply_head_bob(delta):
	if is_on_floor() or is_on_wall() and velocity.length() > 0.5:
		
		bob_time += delta * velocity.length() * float(is_on_floor() or is_on_wall())
	
		
		var bob_offset = Vector3(
			cos(bob_time * bob_frequency / 2) * bob_amplitude,
			sin(bob_time * bob_frequency) * bob_amplitude,
			0
		)
		
		camera.position = initial_camera_pos + bob_offset
	else:
		
		bob_time = 0
		camera.position = initial_camera_pos

func _update_fov(delta):
	var velocity_clamped = clamp(velocity.length(), 05, sprint_speed * 2)
	var target_fov = base_fov + fov_change * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)

## === Wall Run ===
	if is_on_wall() and Input.is_action_pressed("shift") and Input.is_action_pressed("jump") :
		bob_frequency = 3.1
		bob_amplitude = 0.09
		sprint_speed = 500.0
		velocity.y += 0.07
		await get_tree().create_timer(2.0).timeout
		velocity.y -= 0.05
	elif is_on_floor():
		bob_frequency = 2.0
		bob_amplitude = 0.08 
		sprint_speed = 300.0
	else : 
		walk_speed = 200.0
		sprint_speed = 300.0

	if is_on_wall() and Input.is_action_just_pressed("jump") and double_jump == 1 :
		velocity.y = 5
		double_jump = 0
		await get_tree().create_timer(3).timeout
		double_jump = 1

	if is_on_wall() :
		$CanvasLayer/Control/Label3.text = "Is on Wall"
	else:
		$CanvasLayer/Control/Label3.text = "Is not no Wall"


func shoot():
	var arrow_instance = arrow_scene.instantiate()
	arrow_instance.position = ray.global_position
	arrow_instance.transform.basis = ray.global_transform.basis
	get_parent().add_child(arrow_instance)
	#animation_player.play("Reload")

func first_world():
	if ray.is_colliding():
		var target = ray.get_collider()
		if target != null:
			if target.has_method("visibility"):
				target.visibility(Game.first_mask)
	if Game.kills >= 20:
		Game.first_mask = true
	if Game.kills >= 20:
		damage = 16
