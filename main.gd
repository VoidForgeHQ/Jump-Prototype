extends Node2D
var score = 0


@onready var score_label = $CanvasLayer/ScoreLabel

#func _process(delta):

func _ready():
	GameManager.score = 0
	GameManager.setup_ui()
	GameManager.game_over = false
