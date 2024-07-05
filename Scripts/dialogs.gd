extends Node

var dialog = preload("res://Scenes/dialog_window.tscn")
var is_exist = false

func CreateDialogWindow(character_name:String, text:String, position: Vector2, appear_symbols_speed:int, Liya:Node2D):
	if is_exist == false:
		var di = dialog.instantiate()
		di.character_name = character_name
		di.text = text
		di.position = position
		di.appear_symbols_speed = appear_symbols_speed
		di.Liya = Liya
		Liya.get_node("GUI").add_child(di)
		is_exist = true
	else:
		Liya.get_node("GUI/DialogWindow").queue_free()
		var di = dialog.instantiate()
		di.character_name = character_name
		di.text = text
		di.position = position
		di.appear_symbols_speed = appear_symbols_speed
		di.Liya = Liya
		Liya.get_node("GUI").add_child(di)
		is_exist = true


