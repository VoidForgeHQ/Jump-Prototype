extends Node2D
var score = 0


@onready var score_label = $CanvasLayer/ScoreLabel

#func _process(delta):

func _ready():
	GameManager.score = 0
	GameManager.setup_ui()
	GameManager.game_over = false
	if OS.get_name() == "Android":
		$MobileControls.visible = true
	else:
		$MobileControls.visible = false
	
	
func _on_restart_button_pressed() -> void:
	
	get_tree().paused = false
	get_tree().reload_current_scene()
