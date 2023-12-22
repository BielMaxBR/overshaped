extends StaticBody2D

var item: Node2D

func rodarO():
	Fabric.create_item({
		0: item.corners[1],
		1: item.corners[2],
		2: item.corners[3],
		3: item.corners[0]
	}, Global.root, $Saidas/Saida.global_position)
	
	item.queue_free()

func _process(delta):
	if item:
		if not item.on_ground: return
		rodarO()

func _on_coletor_body_entered(body):
	if body.is_in_group("Item"):
		item = body

func _on_coletor_body_exited(body):
	if body.is_in_group("Item"):
		item = null
