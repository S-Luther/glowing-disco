extends CharacterBody2D

var SPEED = 200.0
const JUMP_VEL = -600.0

@onready var camera = get_node("Camera2D")
@onready var sprite = get_node("Sprite2D")
@onready var animationPlayer = get_node("AnimationPlayer")
var menu = preload("res://scenes/Menu.tscn")


func _ready() -> void:
	self.add_to_group("Player")


func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	
	camera.offset.x = move_toward(camera.offset.x, 0, 0.5)
	
	var direction := Input.get_axis("ui_left", "ui_right");
	
	if direction:
		if(is_on_floor()):
			animationPlayer.play("run")
		velocity.x = direction * SPEED
		print(velocity.x)
		if velocity.x < 0:
			sprite.flip_h = true
		if velocity.x > 0:
			sprite.flip_h = false
	else:
		if(is_on_floor()):
			animationPlayer.play("idle")
		velocity.x = move_toward(velocity.x, 0, 2.0)
		#velocity.x = 0
	
	if Input.is_action_just_pressed("ui_accept"):
		animationPlayer.play("jump")
		velocity.y = JUMP_VEL
		
		camera.offset.x = camera.offset.x + 10
			

		
	move_and_slide();

func _on_exit_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		get_tree().change_scene_to_file("res://scenes/Menu.tscn")



func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		print("wet")
