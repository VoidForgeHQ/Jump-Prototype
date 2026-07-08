extends Node

var score = 0
var high_score = 0
var score_label = null
var game_over = false
const SAVE_PATH = "user://save.dat"


func update_death_ui():
	var death_score = get_node("/root/Main/CanvasLayer2/DeathScore")
	var death_high = get_node("/root/Main/CanvasLayer2/DeathHighScore")

	death_score.text = str(score)
	death_high.text = str(high_score)


func _ready():
	score = 0
	game_over = false
	load_high_score()
	call_deferred("setup_ui")
	
func setup_ui():
	score_label = get_tree().current_scene.find_child("ScoreLabel",true,false)
	update_score_label()
	
func update_score_label():
	if is_instance_valid(score_label):
		score_label.text = "Score: " + str(score) + "\nHigh Score: " + str(high_score)
		
func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_32(high_score)

func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_score = file.get_32()



func add_score(amount):
	score += amount
	get_node("/root/Main/ScoreSound").play()

	if score > high_score:
		high_score = score
		save_high_score()

	update_score_label()
	
	if is_instance_valid(score_label):
		update_score_label()
		
