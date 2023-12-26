#@tool
extends StaticBody2D

@export var object: PackedScene

func _process(delta):
	if not has_node("instance_object") and not object == null:
		var instance = object.instantiate()
		instance.process_mode = Node.PROCESS_MODE_DISABLED
		instance.global_position = global_position
		instance.name = "instance_object"
		add_child(instance)
		
