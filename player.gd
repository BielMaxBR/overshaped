extends CharacterBody2D


const SPEED = 300.0
const TILE_SIZE = Vector2(64,64)
const OFFSET = TILE_SIZE/2

var have_item: Node2D
var grabbing = false

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	look_at(global_position+direction)
	velocity = direction * SPEED
	move_and_slide()
	if have_item != null: 
		if Input.is_action_pressed("pick"):
			grabbing = true
			have_item.global_position = $Hand.global_position
			have_item.on_ground = false
		if Input.is_action_just_released("pick"):
			grabbing = false
			have_item.global_position = ($Hand.global_position + OFFSET).snapped(TILE_SIZE) - OFFSET
			have_item.on_ground = true
func _on_pick_body_entered(body):
	if body.is_in_group("Item") and not grabbing:
		have_item = body


func _on_pick_body_exited(body):
	if body.is_in_group("Item") and not grabbing:
		have_item = null
