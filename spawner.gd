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
	$Timer.wait_time = max(0.7, 2.0 - game_time * 0.03)
	if game_time >= 20 and current_wave == 1:
		current_wave = 2
		wave_label.text = "WAVE 2"
		show_wave_popup("🌊 WAVE 2 🌊")

	elif game_time >= 40 and current_wave == 2:
		current_wave = 3
		wave_label.text = "WAVE 3"
		show_wave_popup("🔥 WAVE 3 🔥")

func _on_timer_timeout():
	var obstacle = obstacle_scene.instantiate()
	obstacle.position = Vector2(900, 0)
	get_parent().add_child(obstacle)
	
func show_wave_popup(text):
	wave_popup.text = text
	wave_popup.visible = true

	await get_tree().create_timer(2.0).timeout

	wave_popup.visible = false
