extends Area2D


var scored = false
var direction  = -1

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	
	position.x += speed * direction * delta

	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return

	print("Obstacle:", global_position.x)
	print("Player:", player.global_position.x)
	
	
	if player != null and $Sprite2D.global_position.x + 150 < player.global_position.x and !scored and !GameManager.game_over:
		print("PASSED")
		scored = true
		GameManager.add_score(1)

	if position.x < -900 or position.x > 1200:
		queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	# Check if the body that touched us is named "CharacterBody2D"
	if body.name == "player":
		print("GAME OVER")
		get_node("/root/Main/DeathSound").play()
		get_tree().paused = true
		get_node("/root/Main/CanvasLayer2/DeathUI").visible = true
		
	
