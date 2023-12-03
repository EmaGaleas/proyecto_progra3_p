extends CharacterBody2D

const max_speed = 400
const acceleration = 1500
const friction = 600
var gravity = 1900
var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta) 
	input.y += gravity*delta

func get_input():
	input.x = int(Input.is_action_pressed("ui_left")) - int(Input.is_action_pressed("ui_right"))
	input.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	if input.x == int(1):
		$runR.scale.x = -3.104
		$runR.show()
		$idle.hide()
	elif input.x == int(-1):
		$runR.scale.x = 3.104
		$idle.hide()
		$runR.play()
		$runR.show()
	elif input.x == int(0):
		$runR.hide()
		$idle.show()


	if input == Vector2.ZERO:
		if velocity.length() > (friction*delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity -= (input * acceleration * delta)
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide()
