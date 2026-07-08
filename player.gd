extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var speed = 200
var jump_force = -350
var gravity = 1000

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		anim.flip_h = true
	else:
		velocity.x = 0

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force
		get_node("/root/Main/JumpSound").play()

	# Animation
	if not is_on_floor():
		anim.play("Jump")
	elif velocity.x != 0:
		anim.play("Idel")
	else:
		anim.play("Idle")

	move_and_slide()
	
func die():
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func _on_area_entered(area):
	die()
