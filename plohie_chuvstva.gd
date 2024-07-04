extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var Beg: float
@export var End: float

@onready var target: CharacterBody2D
@onready var AS = $AnimatedSprite2D
@onready var MC = $MainColl

@onready var Point

var chase = false
var speed = 150
var target_captured = false

func _ready():
	AS.play("Idle")

func _process(delta):
	
	if target_captured == true and target != null:
		target.Health -= 1
		target.debuff1 = 5

func _physics_process(delta):
	# Add the gravity.
	if 1 == 3:
		velocity.y += gravity * delta
	
	if chase == true and target != null:
		#look_at(Vector2(target.position.x,position.y))
		var different = target.position.x - position.x
		var gpx = global_position.x
		if different > 0: #Right
			velocity.x = 50
			AS.play("run")
			AS.flip_h = true
			MC.scale.x = -1
			$HitBox/Coll.scale.x = -1.092
		elif different == 0:
			AS.play("Idle")
			velocity.x = 0
		elif different < 0: #Left
			AS.play("run")
			velocity.x = -50
			AS.flip_h = false
			MC.scale.x = 1
			$HitBox/Coll.scale.x = 1.092
	if target == null:
		velocity = Vector2(0,0)
	move_and_slide()

func _on_sistema_poiska_pidorasov_body_entered(body):
	if body.name == "LiyaPlayer":
		target = body
		chase = true


func _on_hit_box_body_entered(body):
	if body.name == "LiyaPlayer":
		target_captured = true


func _on_hit_box_body_exited(body):
	AS.play("Idle")
	target_captured = false


func _on_sistema_poiska_pidorasov_body_exited(body):
	if body.name == "LiyaPlayer":
		AS.play("Idle")
		target = null
