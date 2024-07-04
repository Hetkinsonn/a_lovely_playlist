extends Node

var dialog = preload("res://Scenes/dialog_window.tscn")

func CreateDialogWindow(character_name:String, text:String, position: Vector2, appear_symbols_speed:int, Liya:Node2D):
	var di = dialog.instantiate()
	di.character_name = character_name
	di.text = text
	di.position = position
	di.appear_symbols_speed = appear_symbols_speed
	di.Liya = Liya
	Liya.add_child(di)
