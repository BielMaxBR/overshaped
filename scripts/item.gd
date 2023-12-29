extends CharacterBody2D
class_name Item

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
@export var corner_text = ""

var on_ground = true
func _ready():
	update_corners()
	corner_maker(corner_text)
func update_corners():
	for i in range(0,4):
		var corn: AnimatedSprite2D = get_node("Corner0" + str(i+1))
		corn.modulate = corners[i].color
		corn.frame = corners[i].shape

func corner_maker(text: String):
	if len(text) != 8: return
	for i in range(0,8,2):
		var corner = text.substr(i,2)
		match corner[0]:
			"C":
				corners[i/2].shape = 0
			"S":
				corners[i/2].shape = 1
			"X":
				corners[i/2].shape = 2
			"W":
				corners[i/2].shape = 3
			"N":
				corners[i/2].shape = 4
		match corner[1]:
			"r":
				corners[i/2].color = Color(1,0,0)
			"g":
				corners[i/2].color = Color(0,1,0)
			"b":
				corners[i/2].color = Color(0,0,1)
			"w":
				corners[i/2].color = Color(1,1,1)
			"y":
				corners[i/2].color = Color(1,1,0)
			"m":
				corners[i/2].color = Color(1,0,1)
			"c":
				corners[i/2].color = Color(0,1,1)
	update_corners()









