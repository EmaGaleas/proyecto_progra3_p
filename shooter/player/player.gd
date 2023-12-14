extends Area2D


class_name Player

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

@export var speed: float = 350.0
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 350.0
@export var bullet_damage: int = 10
@export var bullet_direction: Vector2=Vector2.UP
@onready var shield = $Shield

const MARGIN: float = 32.0

var upper_left: Vector2
var lower_right: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	set_limits()
	SignalManager.on_powerup_hit.connect(on_powerup_hit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = get_input()
	global_position += input * delta * speed
	global_position = global_position.clamp(upper_left, lower_right)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func get_input() -> Vector2:
	
	var v = Vector2(
		Input.get_axis("move_left","move_right"),
		Input.get_axis("move_up", "move_down")
	)
	if v.x !=0:
		animation_player.play("turn")
		if v.x>0:
			sprite_2d.flip_h = true
		else: sprite_2d.flip_h = false
	else:
		animation_player.play("fly")
		
	return v.normalized()

func set_limits()->void:
	var vp = get_viewport_rect()
	lower_right = Vector2(
		vp.size.x - MARGIN,
		vp.size.y - MARGIN
	)
	upper_left = Vector2(MARGIN,MARGIN)

func on_powerup_hit(power_up: GameData.POWERUP_TYPE)-> void:
	print("power up: ", power_up)
	if power_up == GameData.POWERUP_TYPE.SHIELD:
		shield.enable_shield()

func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.setup(
		global_position,
		bullet_direction,
		bullet_speed,
		bullet_damage
	)
	
	get_tree().root.add_child(bullet)


func _on_area_entered(area):
	if(area.is_in_group(GameData.GROUP_ESHIP)) == true:
		SignalManager.on_player_hit.emit(GameData.COLLISION_DAMAGE)
	elif(area.is_in_group(GameData.GROUP_SAURCER)) == true:
		SignalManager.on_player_hit.emit(GameData.COLLISION_DAMAGE)
	elif(area.is_in_group(GameData.GROUP_HOMMING_MISILE)) == true:
		SignalManager.on_player_hit.emit(GameData.MISILE_DAMAGE)
	elif(area.is_in_group(GameData.GROUP_BULLET)) == true:
		SignalManager.on_player_hit.emit(area.get_damage())












