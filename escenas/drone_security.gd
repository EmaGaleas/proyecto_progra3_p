extends CharacterBody2D

const speed=100
var player=null
var playerchase=false
var toques=0

func _physics_process(delta):
	if playerchase:
		velocity = position.direction_to(player.position) * speed
	else:
		velocity = Vector2.ZERO  # Establece la velocidad en cero si no hay jugador
	move_and_slide()

func _on_detect_body_entered(body):
	player=body
	playerchase=true
	$anime.play("impacto")


func _on_detect_body_exited(body):
	player=null
	playerchase=false
	$anime.play("default")


func _on_impacto_dentro_body_entered(body):
	if toques==4:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
	pass
	


func _on_audiodrone_finished():
	$audiodrone.play()


func _on_impacto_dentro_body_exited(body):
	toques=toques+1
	if toques==4:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
	pass
