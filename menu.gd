extends Node2D




func _on_uxodim_pressed():
	pass # Replace with function body.
	get_tree().quit()


func _on_pognali_pressed():
	get_tree().change_scene_to_file("res://sharik_grad.tscn")
