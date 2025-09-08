extends CharacterBody2D

const SPEED = 200.0
const JUMP_VEL = -600.0

@onready var camera = get_node("Camera2D")

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	
	camera.offset.x = move_toward(camera.offset.x, 0, 0.5)
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VEL
		
		camera.offset.x = camera.offset.x + 10
			
	var direction := Input.get_axis("ui_left", "ui_right");
	
	if direction:
		velocity.x = direction * SPEED
		print(velocity.x)
	else:
		velocity.x = move_toward(velocity.x, 0, 2.0)
		#velocity.x = 0
		
	move_and_slide();
