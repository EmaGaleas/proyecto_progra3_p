extends ParallaxBackground
@onready var parallax_layer = $ParallaxLayer
@onready var parallax_layer2 = $ParallaxLayer2
@onready var parallax_layer3 = $ParallaxLayer3

const Speed : float = 200.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parallax_layer.motion_offset.y += Speed * delta * 0.2
	parallax_layer2.motion_offset.y += Speed * delta * 0.3
	parallax_layer3.motion_offset.y += Speed * delta * 0.33

func set_running(running: bool) -> void:
	set_process(running)
