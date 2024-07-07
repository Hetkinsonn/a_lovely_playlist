extends CharacterBody2D

@export var wave_width : float
@export var wave_height : float

var explosion = preload("res://Scenes/explosion.tscn")

var time : float
var y

func death():
	var ei = explosion.instantiate()
	ei.position = global_position
	get_tree().current_scene.add_child(ei)

func _ready():
	await get_tree().create_timer(5).timeout
	death()
	queue_free()

func _process(delta):
	time += delta
	y = sin(time*wave_width)*wave_height
	move_local_x(5)
	move_local_y(y/5)
	move_and_slide()
	

func _on_detector_body_entered(body):
	if body.is_in_group("Enemies"):
		body.queue_free()
		death()
		queue_free()
