extends CharacterBody2D
#signal on_plane_died
@onready var animation_player = $AnimationPlayer
@onready var animated_sprite2 = $AnimatedSprite2D2
@onready var animated_sprite = $AnimatedSprite2D
const gravity: float = 1900.0
const power: float = -400.0
var _dead: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += gravity*delta
	_fly()
	move_and_slide()
	if is_on_floor() == true:
		die()


func _fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = power
		animation_player.play("fly")


func die() -> void:
	if _dead == true:
		return
	_dead = true
	animated_sprite.stop()
	animated_sprite2.stop()
	GameManager.on_game_over.emit()
	set_physics_process(false)
