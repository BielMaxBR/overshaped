extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.root = self
	$Item.corners[0].color = Color.RED + Color.GREEN
	$Item.update_corners()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
