extends Area2D


const SPEED: float = 200.0

@onready var sound = $Sound
@onready var sprite_2d = $Sprite2D

var powerup_type: GameData.POWERUP_TYPE = GameData.POWERUP_TYPE.SHIELD
	
# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_powerup_deploy_sound(sound)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += delta * SPEED

func set_powerup_type(pu: GameData.POWERUP_TYPE) -> void:
	powerup_type = pu
	sprite_2d.texture = GameData.POWERUP_UPS[powerup_type]


func _on_area_entered(area):
	SignalManager.on_powerup_hit.emit(powerup_type)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
