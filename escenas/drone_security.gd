extends CharacterBody2D

const speed=100
var player=null
var playerchase=false
var toques=0
var im=false
var bar=false

func _physics_process(delta):
	if Input.is_action_just_pressed("Aumentar_Velocidad"):
		bar=true
		VariablesGlobales.dash=true
	else:
		bar=false
		
		
	if !im:
		$time.visible=false
	if playerchase and bar==false:
		velocity = position.direction_to(player.position) * speed
	elif playerchase and bar==true:
		$whoosh.play()
		player.position.x+=100
		player.position.y -= 100
		velocity = position.direction_to(player.position) * speed
		bar = false
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

func _on_impacto_dentro_body_entered(body):
	VariablesGlobales.menosVida()
	im = true
	$time.visible = true
	sec=5
	set_process(true)

func _process(delta):
	if im:
		sec-= delta
		$time.text="sec "+str(int(sec))
		if sec<=0:
			VariablesGlobales.videoLVL2=1
			get_tree().change_scene_to_file("res://escenas/story_lvl2.tscn")
			set_process(false)

func _on_impacto_dentro_body_exited(body):
	im=false
	$time.visible=false
	sec=5
	set_process(false)

