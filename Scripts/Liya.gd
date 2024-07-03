extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var HB = $HealthBar

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jj = true
@export var Health = 100
@export var debuff1 = 0 #Can't healing

func _process(delta):
	HB.value = Health
	if Health < 1:
		_exit_tree()
	if Health < 100 and debuff1 == 0:
		Health += 0.05 
	if debuff1 > 0:
		debuff1 -= 0.025
	if debuff1 < 0:
		debuff1 = 0

func _physics_process(delta):
	if is_on_floor():
		jj = true
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor() and jj == true:
		velocity.y = JUMP_VELOCITY
		jj = false
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("hodba")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle")
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
	move_and_slide()

func _input(event):
	if Input.is_action_pressed("mmb_up"):
		$Camera2D.zoom.x *= 1.2
		$Camera2D.zoom.y *= 1.2
	if Input.is_action_pressed("mmb_down"):
		$Camera2D.zoom.x /= 1.2
		$Camera2D.zoom.y /= 1.2
	if Input.is_action_just_pressed("lbm"):
		pass

func _exit_tree():
	get_tree().change_scene_to_file("res://Scenes/test_room.tscn")
