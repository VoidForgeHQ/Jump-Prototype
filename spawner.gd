extends Node2D

@export var obstacle_scene:PackedScene


func _ready():
	$Timer.start()
	
	
func spawn_obstacle():
	var obs = obstacle_scene.instantiate()
	add_child(obs)
	
	obs.global_position = Vector2(800, 0)
	
func _on_timer_timeout():
	var obstacle = obstacle_scene.instantiate()
	obstacle.position = Vector2(900,0)
	get_parent().add_child(obstacle)
