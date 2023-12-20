extends StaticBody2D

var item: Node2D
var preloaded_item = preload("res://item.tscn")

func dividir():
	var new_item_1 = preloaded_item.instantiate()
	var new_item_2 = preloaded_item.instantiate()
	
	new_item_1.corners[0] = item.corners[0].duplicate()
	new_item_2.corners[1] = item.corners[1]
	new_item_2.corners[2] = item.corners[2]
	new_item_1.corners[3] = item.corners[3]
	
	new_item_1.update_corners()
	new_item_2.update_corners()
	
	new_item_1.global_position = $Saidas/SaidaL.global_position
	new_item_2.global_position = $Saidas/SaidaD.global_position
	
	var extracted_shapes_1 = []
	for corner in new_item_1.corners:
		extracted_shapes_1.append(corner.shape)
	
	var extracted_shapes_2 = []
	for corner in new_item_2.corners:
		extracted_shapes_2.append(corner.shape)
	
	if not extracted_shapes_1 == [4,4,4,4]:
		Global.root.add_child(new_item_1)
	else:
		new_item_1.queue_free()
	if not extracted_shapes_2 == [4,4,4,4]:
		Global.root.add_child(new_item_2)
	else:
		new_item_2.queue_free()
	
	item.queue_free()

func _process(delta):
	if item:
		if not item.on_ground: return
		dividir()

func _on_coletor_body_entered(body):
	if body.is_in_group("Item"):
		item = body

func _on_coletor_body_exited(body):
	if body.is_in_group("Item"):
		item = null
