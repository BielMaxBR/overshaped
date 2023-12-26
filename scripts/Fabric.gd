extends Node

var preloaded_item = preload("res://objetos/item.tscn")
var preloaded_pigment = preload("res://objetos/Pigment.tscn")

func create_item(corners: Dictionary, parent: Node2D, position: Vector2):
	var new_item: Item = preloaded_item.instantiate()
	for index in corners.keys():
		new_item.corners[index] = corners[index]
	
	new_item.global_position = position
	
	var extracted_shapes = []
	for corner in new_item.corners:
		if corner.shape != Item.SHAPES.NONE:
			extracted_shapes.append(corner.shape)
	
	if not len(extracted_shapes) == 0:
		parent.add_child(new_item)
	else:
		new_item.queue_free()

func create_pigment(color: Color, parent: Node2D, position: Vector2) -> void:
	var pigment = preloaded_pigment.instantiate()
	
	pigment.color = color
	pigment.global_position = position
	parent.add_child(pigment)
