extends Area2D


func _on_del_animation_finished():
	get_tree().change_scene_to_file("res://escenas/menu.tscn")


func _on_body_entered(body):
	$del.play("default")
	$sdd.play()
