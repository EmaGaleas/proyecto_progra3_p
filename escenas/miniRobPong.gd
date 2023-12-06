extends CharacterBody2D

var switch=true;



func _on_sprite_2d_ready():
	$Sprite2D.visible=false
	$AnimatedSprite2D.visible=false
