extends CharacterBody2D

enum SHAPES {CIRCLE, SQUARE, STAR, WIND, NONE}

@export var corners := [{
		color = Color(1,1,1),
		shape = SHAPES.NONE
	},{
		color = Color(1,1,1),
		shape = SHAPES.NONE
	},{
		color = Color(1,1,1),
		shape = SHAPES.NONE
	},{
		color = Color(1,1,1),
		shape = SHAPES.NONE
	}]

var on_ground = true

func _ready():
	update_corners()

func update_corners():
	for i in range(0,4):
		var corn: AnimatedSprite2D = get_node("Corner0" + str(i+1))
		corn.modulate = corners[i].color
		corn.frame = corners[i].shape
