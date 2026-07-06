extends Node


var wave = 1
var game_time = 0.0

func _process(delta):
	game_time += delta

	if game_time >= 20 and wave == 1:
		wave = 2
	
	elif game_time >= 40 and wave == 2:
		wave = 3
	
