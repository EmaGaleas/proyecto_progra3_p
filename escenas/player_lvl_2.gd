extends CharacterBody2D

const SPEED = 325.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var audioSalto = $saltar
@onready var audioCorrer = $correr
@onready var audioDefault = $default
var is_running = false
var is_jumping = false
var muere=false

func _physics_process(delta):
	if not is_on_floor() and !muere:
		velocity.y += gravity * delta
		is_jumping = true
	elif !muere:
		is_jumping=false
	if position.y >= 795 and!muere:
		muere=true
		$Spriteidle.play("muere")
	if position.y >= 1000:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
	if Input.is_action_just_pressed("move_up") and is_on_floor() and !muere:
		velocity.y = JUMP_VELOCITY
		$Spriteidle.play("saltar")
		audioSalto.pitch_scale=2#aumenta vel audio
		audioSalto.play() 
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction and !muere:
		if is_on_floor() and !muere:
			audioCorrer.play()
		if direction>0 and !muere:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=false
			
		elif !muere:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=true
		
		velocity.x = direction * SPEED
		
	else:
		if not Input.is_action_pressed("move_up") and is_on_floor() and !muere:
			$Spriteidle.play("default")
			audioCorrer.stop()
		elif position.y >= 795 :
			$Spriteidle.play("muere")
		elif !muere:
			$Spriteidle.play("saltar")
			
	
	
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_default_finished():
	audioDefault.play() # Replace with function body.
	

