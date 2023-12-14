extends PathFollow2D

var missile_scene: PackedScene = preload("res://shooter/homming_misile/homming_misile.tscn")

@onready var animation_tree = $AnimationTree["parameters/playback"]
@onready var health_bar = $HealthBar
@onready var booms = $Booms

const SPEED: float = 0.08
const SHOOT_PROGRESS: float = 0.02
const FIRE_OFFSETS = [0.25, 0.5, 0.75]
const BOOM_DELAY: float = 0.15
const HIT_DAMAGE: float = 40
const SCORE: float = 150

var shooting: bool = false
var shoots_fired: int =0


# Called when the node enters the scene tree for the first time.
func _ready():
	progress_ratio = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shooting == false:
		progress_ratio += SPEED * delta
		try_shoot()


func update_shots_fired()-> void:
	shoots_fired += 1 
	if shoots_fired >= len(FIRE_OFFSETS):
		shoots_fired = 0


func try_shoot()-> void:
	if abs(progress_ratio - FIRE_OFFSETS[shoots_fired]) < SHOOT_PROGRESS:
		animation_tree.travel("shoot")
		update_shots_fired()
		

func set_shooting(v: bool) ->void:
	shooting = v

func shoot()->void:
	var misile = missile_scene.instantiate()
	get_tree().root.add_child(misile)
	misile.global_position = global_position

func died()-> void:
	ScoreManager.increment_score(SCORE)
	queue_free()


func make_booms()->void:
	for b in booms.get_children():
		ObjectMaker.create_boom(b.global_position)
		await get_tree().create_timer(BOOM_DELAY).timeout

func _on_health_bar_died():
	health_bar.disconnect("died", _on_health_bar_died)
	animation_tree.travel("death")


func _on_area_2d_area_entered(area):
	health_bar.take_damage(HIT_DAMAGE)
