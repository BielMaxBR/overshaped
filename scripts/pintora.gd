extends StaticBody2D

var item_a
var item_b

func pintar():
	# checar se a fusão é possivel
	if item_a.get_script() == item_b.get_script():
		return
	# pega os cantos não vazios
	var item
	var pigment
	if item_a is Item:
		item = item_a
		pigment = item_b
	elif item_a is Pigment:
		item = item_b
		pigment = item_a
		
	var corners = {}
	for i in range(0,4):
		var corner = item.corners[i]
		corners[i] = {shape = corner.shape, color = pigment.color}
	
	Fabric.create_item(corners,Global.root,$Saidas/Saida.global_position)
	item_a.queue_free()
	item_b.queue_free()
	
	
func _process(delta):
	if item_a and item_b:
		if item_a.on_ground and item_b.on_ground:
			pintar()


func _on_coletor_a_body_entered(body):
	if (body.is_in_group("Item") or body.is_in_group("Pigment")) and item_a == null:
		item_a = body

func _on_coletor_a_body_exited(body):
	if (body.is_in_group("Item") or body.is_in_group("Pigment")) and item_a == body:
		item_a = null

func _on_coletor_b_body_entered(body):
	if (body.is_in_group("Item") or body.is_in_group("Pigment")) and item_b == null:
		item_b = body

func _on_coletor_b_body_exited(body):
	if (body.is_in_group("Item") or body.is_in_group("Pigment")) and item_b == body:
		item_b = null
