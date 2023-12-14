extends Area2D


var direction: Vector2 = Vector2.UP
var speed: float = 150.0
var damage: int = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	


func setup(pos: Vector2, dir: Vector2, sp: float, dm: int) -> void:
	direction = dir
	speed = sp
	damage = dm
	global_position = pos


func blowup(area:Node2D) -> void:
	var net_position = global_position - area.global_position
	ObjectMaker.create_explosion(net_position, area)
	set_process(false)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	blowup(area)
