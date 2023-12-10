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
var dash=false


func _physics_process(delta):
	barraDevida()
	if Input.is_action_just_pressed("Aumentar_Velocidad"):
		$Spriteidle.play("dash")
	if not is_on_floor() and !muere:
		velocity.y += gravity * delta
		is_jumping = true
		if dash:
			$Spriteidle.play("dash")
		else:
			$Spriteidle.play("saltar")
	elif !muere:
		is_jumping=false
	if position.y >= 780 and !muere:
		muere=true
		mu.play()
		$Spriteidle.play("muere")
	if position.y >= 1000:
		VariablesGlobales.videoLVL2=2
		get_tree().change_scene_to_file("res://escenas/story_lvl2.tscn")
	if Input.is_action_just_pressed("move_up") and is_on_floor() and !muere:
		velocity.y = JUMP_VELOCITY
		$Spriteidle.play("saltar")
		audioSalto.pitch_scale=2
		audioSalto.play() 
	var direction = Input.get_axis("move_left", "move_right")
	if direction and !muere:
		if direction>0 and !muere and !is_jumping:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=false
			audioCorrer.play()
		elif !muere and !is_jumping:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=true
			audioCorrer.play()
		elif is_jumping:
			$Spriteidle.play("saltar")
			#audioCorrer.stop()
		velocity.x = direction * SPEED
	else:
		if not Input.is_action_pressed("move_up") and is_on_floor() and !muere:
			$Spriteidle.play("default")
			#audioCorrer.stop()
		elif !muere and position.y <790:
			$Spriteidle.play("saltar")
			audioSalto.play()
			
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()



func _on_default_finished():
	audioDefault.play() # Replace with function body.
	
func barraDevida():
	h=VariablesGlobales.salud
	$salud.value=h
	get_node("Label").text="Toques:"+str(h)
	if VariablesGlobales.salud==0:
		$Spriteidle.play("lastimado")
		mu.pitch_scale=3
		mu.play()
		VariablesGlobales.salud=4
		VariablesGlobales.videoLVL2=1
		get_tree().change_scene_to_file("res://escenas/story_lvl2.tscn")
		
		
		



func _on_fondo_2_0_finished():
	$fondo2_0.play()


func _on_correr_finished():
	$correr.play()
