extends StaticBody2D

var item: Node2D

func entregar():
	if item.corners == Global.actual_request.corners:
		item.queue_free()
		Global.next_item()

func _process(delta):
	if item:
		if not item.on_ground: return
		entregar()

func _on_coletor_body_entered(body):
	if body.is_in_group("Item") and item == null:
		item = body

func _on_coletor_body_exited(body):
	if body.is_in_group("Item") and item == body:
		item = null
