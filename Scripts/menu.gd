extends CenterContainer

var level = preload("res://scenes/Level.tscn")

func changeScene(node):
	var tree = get_tree();
	var cur_scene = tree.get_current_scene();
	var nodeInstance = node.instantiate();
	tree.get_root().add_child(nodeInstance)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(nodeInstance)

func _on_level_1_pressed() -> void:
	changeScene(level)

func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.
