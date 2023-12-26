extends StaticBody2D

var item_a: Pigment
var item_b: Pigment

func misturar():
	# checar se a fusão é possivel
	var is_possible = true
	is_possible = item_a.color != item_b.color
	
	if not is_possible: return
	
	Fabric.create_pigment(item_a.color + item_b.color, Global.root,$Saidas/Saida.global_position)
	
	item_a.queue_free()
	item_b.queue_free()
	
	
func _process(delta):
	if item_a and item_b:
		if item_a.on_ground and item_b.on_ground:
			misturar()


func _on_coletor_a_body_entered(body):
	if body.is_in_group("Pigment") and item_a == null:
		item_a = body

func _on_coletor_a_body_exited(body):
	if body.is_in_group("Pigment") and item_a == body:
		item_a = null

func _on_coletor_b_body_entered(body):
	if body.is_in_group("Pigment") and item_b == null:
		item_b = body

func _on_coletor_b_body_exited(body):
	if body.is_in_group("Pigment") and item_b == body:
		item_b = null
