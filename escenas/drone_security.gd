extends CharacterBody2D

const speed=100
var player=null
var playerchase=false
var toques=0
var im=false

func _physics_process(delta):
	if !im:
		$time.visible=false
	if playerchase:
		velocity = position.direction_to(player.position) * speed
	else:
		velocity = Vector2.ZERO  #no 
	move_and_slide()

func _on_detect_body_entered(body):
	player=body
	playerchase=true
	$anime.play("impacto")


func _on_detect_body_exited(body):
	player=null
	playerchase=false
	$anime.play("default")

func _on_audiodrone_finished():
	$audiodrone.play()
	

var sec=0
var impacto=false

func _on_impacto_dentro_body_entered(body):
	im = true
	impacto=true
	$time.visible = true
	sec=4
	set_process(true)

func _process(delta):
	if im:
		sec-= delta
		$time.text="sec "+str(int(sec))
		if sec<=0:
			get_tree().change_scene_to_file("res://escenas/menu.tscn")
			set_process(false)

func _on_impacto_dentro_body_exited(body):
	im=false
	$time.visible=false
	sec=4
	set_process(false)

