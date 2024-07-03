extends Node2D

@onready var point =  $point
@onready var Liya = $LiyaPlayer
@onready var Enemy = $Plohie_chuvstva

func _process(delta):
	point.position = Vector2(Liya.position.x, Enemy.position.y)
