extends Node2D

@onready var wave_label = get_node("/root/Main/CanvasLayer/WaveLabel")

@export var obstacle_scene: PackedScene

var game_time = 0.0

func _ready():
	$Timer.start()

func _process(delta):
	game_time += delta
	$Timer.wait_time = max(0.7, 2.0 - game_time * 0.03)

	if game_time < 20:
		wave_label.text = "WAVE 1"

	elif game_time < 40:
		wave_label.text = "WAVE 2"

	else:
		wave_label.text = "WAVE 3"

func _on_timer_timeout():
	var obstacle = obstacle_scene.instantiate()
	obstacle.position = Vector2(900, 0)
	get_parent().add_child(obstacle)
