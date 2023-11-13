extends CharacterBody2D

const speed=400

func _physics_process(delta):
	var direction=Input.get_axis("move_up", "move_down")
	if direction:
		velocity.y=direction*speed
	else:
		velocity.y=move_toward(velocity.y,0,speed)
	move_and_slide()
		
