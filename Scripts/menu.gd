extends ColorRect


func _on_level_1_pressed() -> void:
	
	get_tree().change_scene_to_file("res://scenes/Level.tscn")

func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.
