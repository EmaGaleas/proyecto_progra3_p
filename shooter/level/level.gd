extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreManager.reset_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_R) == true:
		game_manager.load_level_scene()
	if Input.is_action_just_pressed("test") ==true:
		ObjectMaker.create_power_up(Vector2(200,200), GameData.POWERUP_TYPE.SHIELD)
