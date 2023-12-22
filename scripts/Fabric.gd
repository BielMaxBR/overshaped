extends Node

var preloaded_item = preload("res://item.tscn")

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
	
