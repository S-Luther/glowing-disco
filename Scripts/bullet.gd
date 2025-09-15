extends Area2D

var angle = 0.0

func _physics_process(delta: float) -> void:
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print(body_rid)
	print(body)
	body.apply_scale(Vector2(2,2))
	queue_free()
