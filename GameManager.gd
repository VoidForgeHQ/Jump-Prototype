extends Node

var score = 0
var high_score = 0
var score_label = null
var game_over = false

func _ready():
	score = 0
	call_deferred("setup_ui")
	
func setup_ui():
	score_label = get_tree().current_scene.find_child("ScoreLabel",true,false)
	update_score_label()
	
	
	score_label = get_tree().current_scene.find_child("ScoreLabel",true,false)
	update_score_label()
	
func update_score_label():
	if is_instance_valid(score_label):
		score_label.text = "Score: " + str(score) + "\nHigh Score: " + str(high_score)
func add_score(amount):
	score += amount
	
	if score > high_score:
		high_score = score
	setup_ui()
	update_score_label()
	
	if is_instance_valid(score_label):
		update_score_label()
		
