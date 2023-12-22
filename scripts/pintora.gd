extends StaticBody2D

var item_a: Item
var item_b: Item

func fusionar():
	# checar se a fusão é possivel
	var is_possible = true
	for i in range(0,4):
		if item_a.corners[i].shape != Item.SHAPES.NONE and item_b.corners[i].shape != Item.SHAPES.NONE:
			is_possible = false
			
	if not is_possible:
		item_a.global_position = $Saidas/Saida.global_position
		item_b.global_position = $Saidas/Saida.global_position
		item_a = null
		item_b = null
		return
	# pega os cantos não vazios
	var corners = {}
	for i in range(0,4):
		var corner_a = item_a.corners[i]
		var corner_b = item_b.corners[i]
		if corner_a.shape == Item.SHAPES.NONE:
			corners[i] = corner_b
		else:
			corners[i] = corner_a
	
	Fabric.create_item(corners,Global.root,$Saidas/Saida.global_position)
	item_a.queue_free()
	item_b.queue_free()
	
	
func _process(delta):
	if item_a and item_b:
		if item_a.on_ground and item_b.on_ground:
			fusionar()


func _on_coletor_a_body_entered(body):
	if body.is_in_group("Item") and item_a == null:
		item_a = body

func _on_coletor_a_body_exited(body):
	if body.is_in_group("Item") and item_a == body:
		item_a = null

func _on_coletor_b_body_entered(body):
	if body.is_in_group("Item") and item_b == null:
		item_b = body

func _on_coletor_b_body_exited(body):
	if body.is_in_group("Item") and item_b == body:
		item_b = null
