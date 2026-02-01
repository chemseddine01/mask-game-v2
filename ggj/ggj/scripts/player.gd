extends CharacterBody3D
@onready var head: Node3D = $head
@onready var camera: Camera3D = $head/Camera3D

var speed = 5
var JUMP_VELOCITY = 4
var sensetivity = 0.004

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * sensetivity)
		camera.rotate_x(-event.relative.y * sensetivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(90))

func _physics_process(delta: float) -> void:
	# Handle shooting
	

		
	
	
#	change_color()
	# Check zombie health after modification

	# Add the gravity
	if !is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle sprint
	if Input.is_action_pressed("shift") and Input.is_action_pressed("forward") and is_on_floor():
		speed = 7
	else:
		speed = 5
	
	# Get the input direction and handle the movement/deceleration
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	move_and_slide()
