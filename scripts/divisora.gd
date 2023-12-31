extends StaticBody2D

var item: Node2D

func dividir():
	Fabric.create_item({
		0: item.corners[0],
		3: item.corners[3]
	}, Global.root, $Saidas/SaidaL.global_position)
	
	Fabric.create_item({
		1: item.corners[1],
		2: item.corners[2]
	}, Global.root, $Saidas/SaidaD.global_position)
	
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
