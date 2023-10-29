extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Spriteidle.play("saltar")

	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
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
		else:
			$Spriteidle.play("saltar")
			
		
	
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
