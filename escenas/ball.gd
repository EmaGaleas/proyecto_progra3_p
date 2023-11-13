extends CharacterBody2D


const speed = 600

func _ready():
	initializeBall()

func initializeBall():
	randomize()
	var y_direction = [-1, 1]
	var x_direction = [-0.5, 0.5]
	velocity.x = x_direction[randi() % 2]
	velocity.y = y_direction[randi() % 2]

func _physics_process(delta):
	var collide = move_and_collide(velocity * speed * delta)
	if collide:
		velocity = velocity.bounce(collide.get_normal())

