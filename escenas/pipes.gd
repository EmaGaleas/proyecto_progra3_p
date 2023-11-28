extends Node2D

const scroll_speed: float = 250.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= scroll_speed * delta

func player_scored() -> void:
	GameManager.increment_score()

func _on_screen_exited():
	queue_free()

func _on_laser_body_entered(body):
	if body.is_in_group(GameManager.grupo_delorian) == true:
		player_scored()


func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.grupo_delorian) == true:
		body.die()
