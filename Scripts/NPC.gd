extends CharacterBody2D

var SPEED = 300

func move(target, delta):
	var direction = (target - global_position).normalized()
	var desired_velocity = direction * SPEED
	var steering = (desired_velocity - velocity) * delta * .5
	
	velocity += steering
	
	self.rotation = velocity.angle()
	
func _physics_process(delta: float) -> void:
	var attackee = get_tree().get_first_node_in_group("Player")
	
	move(attackee.global_position, delta)
	
	move_and_slide();
