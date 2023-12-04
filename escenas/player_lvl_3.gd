extends CharacterBody2D

const max_speed = 400
const acceleration = 1500
const friction = 600
var input = Vector2.ZERO

var bullet = preload("res://escenas/bullet.tscn")
var can_fire = true
var rate_of_fire = 0.4

func _process(delta):
	SkillLoop()

func _physics_process(delta):
	player_movement(delta) 

func SkillLoop():
	if Input.is_action_pressed("shoot") and can_fire == true:
		can_fire = false
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(bullet_instance)
		await(get_tree().create_timer(rate_of_fire))
		can_fire = true

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
