extends CharacterBody2D
class_name Pigment

var on_ground = true

var color = Color(0,0,0)

func _process(delta):
	if color != modulate: modulate = color
