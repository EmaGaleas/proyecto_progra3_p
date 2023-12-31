extends CharacterBody2D

const SPEED = 325.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var audioSalto = $saltar
@onready var audioCorrer = $correr
@onready var audioDefault = $default
@onready var mu = $muere
var is_running = false
var is_jumping = false
var muere=false
var audio=true
var h=1
var anime



func _physics_process(delta):
	barraDevida()
	anime=VariablesGlobales.dash
	if not is_on_floor() and !muere and !anime:
		velocity.y += gravity * delta
		is_jumping = true
		$Spriteidle.play("saltar")
	elif !muere:
		$Spriteidle.modulate = Color(1, 1, 1, 1)
		is_jumping=false
	if position.y >= 780 and !muere and !anime:
		muere=true
		mu.play()
		$Spriteidle.play("muere")
	if position.y >= 1000:
		VariablesGlobales.videoLVL2=2
		get_tree().change_scene_to_file("res://escenas/story_lvl2.tscn")
	if Input.is_action_just_pressed("move_up") and is_on_floor() and !muere and !anime:
		velocity.y = JUMP_VELOCITY
		$Spriteidle.play("saltar")
		audioSalto.pitch_scale=2
		audioSalto.play() 
	var direction = Input.get_axis("move_left", "move_right")
	if direction and !muere and !anime:
		if direction>0 and !muere and !is_jumping:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=false
			audioCorrer.play()
			#velocity
		elif !muere and !is_jumping:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=true
			audioCorrer.play()
		elif is_jumping and !anime:
			$Spriteidle.play("saltar")
			#audioCorrer.stop()
		velocity.x = direction * SPEED
	else:
		if not Input.is_action_pressed("move_up") and is_on_floor() and !muere and !anime:
			$Spriteidle.play("default")
			#audioCorrer.stop()
		elif !muere and position.y <790 and !anime:
			$Spriteidle.play("saltar")
			audioSalto.play()
		elif anime:
			$timerBlurry.start(2)
			$Spriteidle.modulate = Color(1, 1, 1, 0.5)
			$Spriteidle.play("dash")
			VariablesGlobales.dash=false
			
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()



func _on_default_finished():
	audioDefault.play() # Replace with function body.
	
func barraDevida():
	h=VariablesGlobales.salud
	$salud.value=h
	get_node("Label").text="Toques:"+str(h)
	if VariablesGlobales.salud==0:
		#$Spriteidle.play("lastimado")
		mu.pitch_scale=3
		mu.play()
		VariablesGlobales.salud=4
		VariablesGlobales.videoLVL2=1
		get_tree().change_scene_to_file("res://escenas/story_lvl2.tscn")
		
		
		



func _on_fondo_2_0_finished():
	$fondo2_0.play()


func _on_correr_finished():
	$correr.play()


func _on_timer_blurry_timeout():
	$Spriteidle.modulate = Color(1, 1, 1, 1)
