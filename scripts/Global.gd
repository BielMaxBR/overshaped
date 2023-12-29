extends Node

var root: Node2D

var actual_request: Item
var list = []
var index = -1
@onready var viewport = $cont/vew
func _ready(): 
	list = $cont/vew/Items.get_children()
	next_item()

func next_item():
	if actual_request:
		actual_request.hide()
	index += 1
	actual_request = list[index]
	actual_request.show()
