extends CharacterBody2D

var speed=180
func _physics_process(delta):
	if Input.is_action_just_pressed("Aumentar_Velocidad"):
		speed+=50
	if Input.is_action_just_pressed("Disminuir_Velocidad"):
		speed-=50
	if Input.is_action_just_pressed("Resetear_Pong"):
		position.y=451
		position.x=51
	var direction=Input.get_axis("move_up", "move_down")
	if direction:
		velocity.y=direction*speed
	else:
		velocity.y=move_toward(velocity.y,0,speed*delta)
	position.y += velocity.y * delta
	position.x = 51
	move_and_slide()
		

