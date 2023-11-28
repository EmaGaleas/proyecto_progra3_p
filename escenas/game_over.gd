extends Control

@onready var game_over = $GameOverL
@onready var press_space = $PressSpaceL
@onready var timer = $Timer
@onready var end = $End

var can_press_space: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_press_space == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.load_menu_scene()

func on_game_over()->void:
	show()
	timer.start()
	

func run_sequence() -> void:
	game_over.hide()
	end.hide()
	press_space.show()
	can_press_space = true

func _on_timer_timeout():
	run_sequence()
