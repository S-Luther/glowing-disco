extends CharacterBody2D

var angle = 0.0

func _physics_process(delta: float) -> void:
	velocity = Vector2(100, 0).rotated(angle)
	angle = angle + .1
	move_and_slide()
