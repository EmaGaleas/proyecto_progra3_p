extends CharacterBody2D

var speed=275
var player=null
var playerchase=false
	
func _physics_process(delta):
	if Input.is_action_just_pressed("Resetear_Pong"):
		position.y=451
		position.x=1349
	
	if playerchase:
		var direction = position.direction_to(player.position)
		velocity.y = direction.y * speed
	else:
		velocity.y=move_toward(velocity.y,0,speed*delta)
	position.y += velocity.y * delta
	position.x = 1349
	move_and_slide()


func _on_area_2d_body_entered(body):
	player=body
	playerchase=true
	

