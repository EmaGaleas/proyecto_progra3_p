extends CharacterBody2D
#cyber
const SPEED = 500.0
const JUMP_VELOCITY = -600.0

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
		
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY*1.5
	
		$Spritecyber.play("saltar")
		audioSalto.pitch_scale=2.5#aumenta vel audio
		audioSalto.play() 
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		if is_on_floor():
			audioCorrer.play()
		if direction>0:
			$Spritecyber.play("correr")
			$Spritecyber.flip_h=false
			
		else:
			$Spritecyber.play("correr")
			$Spritecyber.flip_h=true
		
		velocity.x = (direction * SPEED)*1.5
		
	else:
		if not Input.is_action_pressed("move_up") and is_on_floor():
			$Spritecyber.play("default")
			audioCorrer.stop()
		else:
			$Spritecyber.play("saltar")
		
	
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_default_finished():
	audioDefault.play() # Replace with function body.
	
func _ready():# doble sprite2d
	$Spritecyber.scale *= Vector2(3, 3)

