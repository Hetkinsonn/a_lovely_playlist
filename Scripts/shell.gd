extends CharacterBody2D

@export var wave_width : float
@export var wave_height : float

var time : float
var y

func _process(delta):
	time += delta
	y = sin(time*wave_width)*wave_height
	print(y)
	velocity = Vector2(50,y)
	move_and_slide()

