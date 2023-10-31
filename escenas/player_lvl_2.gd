extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var audioSalto = $saltar
@onready var audioCorrer = $correr
@onready var audioDefault = $default
var is_running = false
var is_jumping = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		is_jumping = true
	else:
		is_jumping=false
	if position.y >= 795:
		$Spriteidle.play("muere")
	if position.y >= 800:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Spriteidle.play("saltar")
		audioSalto.pitch_scale=2#aumenta vel audio
		audioSalto.play() 
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		if is_on_floor():
			audioCorrer.play()
		if direction>0:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=false
			
		else:
			$Spriteidle.play("correr")
			$Spriteidle.flip_h=true
		
		velocity.x = direction * SPEED
		
	else:
		if not Input.is_action_pressed("move_up") and is_on_floor():
			$Spriteidle.play("default")
			audioCorrer.stop()
		else:
			$Spriteidle.play("saltar")
		
	
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_default_finished():
	audioDefault.play() # Replace with function body.

