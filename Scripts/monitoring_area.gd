extends Area2D

@export var target : CharacterBody2D



func _on_body_entered(body):
	if body.name == "LiyaPlayer":
		target = body


func _on_body_exited(body):
	if body.name == "LiyaPlayer":
		target = null
