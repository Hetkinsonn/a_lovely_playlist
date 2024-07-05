extends Control

@export var character_name: String
@export var text: String
@export_range(0,100) var appear_symbols_speed : int
@export var Liya : Node2D

func _ready():
	name = "DialogWindow"
	$CharacterName.text = str(character_name)
	$DialogText.text = str(text)
