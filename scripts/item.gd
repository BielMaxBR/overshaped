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
	text_to_corner(corner_text)
func update_corners():
	for i in range(0,4):
		var corn: AnimatedSprite2D = get_node("Corner0" + str(i+1))
		corn.modulate = corners[i].color
		corn.frame = corners[i].shape

func text_to_corner(text: String):
	if len(text) != 8: 
		corner_to_text()
		return
	for i in range(0,8,2):
		var corner = text.substr(i,2)
		match corner[0]:
			"C":
				corners[i/2].shape = SHAPES.CIRCLE
			"S":
				corners[i/2].shape = SHAPES.SQUARE
			"X":
				corners[i/2].shape = SHAPES.STAR
			"W":
				corners[i/2].shape = SHAPES.WIND
			"N":
				corners[i/2].shape = SHAPES.NONE
		match corner[1]:
			"r":
				corners[i/2].color = Color.RED
			"g":
				corners[i/2].color = Color.GREEN
			"b":
				corners[i/2].color = Color.BLUE
			"w":
				corners[i/2].color = Color.WHITE
			"y":
				corners[i/2].color = Color.YELLOW
			"m":
				corners[i/2].color = Color.MAGENTA
			"c":
				corners[i/2].color = Color.CYAN
	update_corners()

func corner_to_text():
	var text = ""
	for i in range(0,4):
		var corner = corners[i]
		match corner.shape:
			SHAPES.CIRCLE:
				text += "C"
			SHAPES.SQUARE:
				text += "S"
			SHAPES.STAR:
				text += "X"
			SHAPES.WIND:
				text += "W"
			SHAPES.NONE:
				text += "S"
		match corner.color:
			Color.RED:
				text += "r"
			Color.GREEN:
				text += "g"
			Color.BLUE:
				text += "b"
			Color.YELLOW:
				text += "y"
			Color.MAGENTA:
				text += "m"
			Color.CYAN:
				text += "c"
			Color.WHITE:
				text += "w"
	corner_text = text
	return text







