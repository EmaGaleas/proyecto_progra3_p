extends Node2D

const ANIM_FRAMES = {
	GameData.ENEMY_TYPE.ZIPPER: ["zipper_1", "zipper_2"," zipper_3"],
	GameData.ENEMY_TYPE.BIO: ["biomech_1", "biomech_2"," biomech_3"],
	GameData.ENEMY_TYPE.BOMBER: ["bomber_1", "bomber_2", "bomber_3"]
}

const ENEMY_SCENES = {
	GameData.ENEMY_TYPE.ZIPPER: preload("res://shooter/enemies/enemy_zipper.tscn"),
	GameData.ENEMY_TYPE.BIO: preload("res://shooter/enemies/enemy_bio.tscn"),
	GameData.ENEMY_TYPE.BOMBER: preload("res://shooter/enemies/enemy_bomber.tscn")
}

@onready var paths = $Paths

var path_list: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	path_list = paths.get_children()
	spawn_waves()


func create_enemy(speed: float, anim_name: String, en_type: GameData.ENEMY_TYPE):
	var new_en = ENEMY_SCENES[en_type].instantiate()
	new_en.setup(speed,anim_name)
	return new_en

func spawn_waves() -> void:
	var path = path_list.pick_random()
	var en_type = GameData.ENEMY_TYPE.values().pick_random()
	var anim = ANIM_FRAMES[en_type].pick_random()
	
	for num in range(4):
		path.add_child(create_enemy(0.2, anim, en_type))
		await get_tree().create_timer(1).timeout


func _on_spawn_timer_timeout():
	spawn_waves()
