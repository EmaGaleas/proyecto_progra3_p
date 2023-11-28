extends CharacterBody2D


const speed = 800

func _ready():
	if VariablesGlobales.estadoPong==false:
		initializeBall()
	else: 
		pass

func initializeBall():
	randomize()
	var y_direction = [-1, 1]
	var x_direction = [-0.5, 0.5]
	velocity.x = x_direction[randi() % 2]
	velocity.y = y_direction[randi() % 2]

func _physics_process(delta):
	if VariablesGlobales.estadoPong:
		velocity = Vector2(0, 0)
	else:
		if Input.is_action_just_pressed("Resetear_Pong"):
			position.y=450
			position.x=700
			randomize()
			var y_direction = [-1, 1]
			var x_direction = [-0.5, 0.5]
			velocity.x = x_direction[randi() % 2]
			velocity.y = y_direction[randi() % 2]
		var collide = move_and_collide(velocity * speed*delta)
		if collide:
			$rebote.play()
			velocity = velocity.bounce(collide.get_normal())

