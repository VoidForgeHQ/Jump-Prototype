extends Node2D

@onready var wave_label = get_node("/root/Main/CanvasLayer/WaveLabel")
@onready var wave_popup = get_node("/root/Main/CanvasLayer/WavePopup")

@export var obstacle_scene: PackedScene

var current_wave = 1
var game_time = 0.0

func _ready():
	$Timer.start()

	wave_label.text = "WAVE 1"
	wave_popup.text = "🌊 WAVE 1 🌊"
	wave_popup.visible = true

	await get_tree().create_timer(2.0).timeout

	wave_popup.visible = false
	
	
func _process(delta):
	game_time += delta

	if game_time >= 20 and current_wave == 1:
		current_wave = 2
		wave_label.text = "WAVE 2"
		show_wave_popup("🌊 WAVE 2 🌊")

	elif game_time >= 40 and current_wave == 2:
		current_wave = 3
		wave_label.text = "WAVE 3"
		show_wave_popup("🔥 WAVE 3 🔥")

	elif game_time >= 60 and current_wave == 3:
		current_wave = 4
		wave_label.text = "WAVE 4"
		show_wave_popup("⚡ WAVE 4 ⚡")

	elif game_time >= 80 and current_wave == 4:
		current_wave = 5
		wave_label.text = "WAVE 5"
		show_wave_popup("💀 WAVE 5 💀")

func _on_timer_timeout():
	var obstacle = obstacle_scene.instantiate()

	var random_y = randi_range(-20, 20)

	match current_wave:

		1:
			obstacle.speed = 250
			obstacle.position = Vector2(900, random_y)
			obstacle.direction = -1

		2:
			obstacle.speed = 300
			obstacle.position = Vector2(900, random_y)
			obstacle.direction = -1

		3:
			obstacle.speed = 350

			if randi() % 2 == 0:
				obstacle.position = Vector2(900, random_y)
				obstacle.direction = -1
				obstacle.rotation_degrees = 0
			else:
				obstacle.position = Vector2(-200, random_y)
				obstacle.direction = 1
				obstacle.rotation_degrees = 180

		4, 5:
			obstacle.speed = 400 + (current_wave - 4) * 50

			if randi() % 2 == 0:
				obstacle.position = Vector2(900, random_y)
				obstacle.direction = -1
				obstacle.rotation_degrees = 0
			else:
				obstacle.position = Vector2(-200, random_y)
				obstacle.direction = 1
				obstacle.rotation_degrees = 180

	get_parent().add_child(obstacle)
	
func show_wave_popup(text):
	wave_popup.text = text
	wave_popup.visible = true

	await get_tree().create_timer(2.0).timeout

	wave_popup.visible = false
