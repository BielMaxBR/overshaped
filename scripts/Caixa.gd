extends StaticBody2D
class_name Box
@export var object: PackedScene
@export var object_properties: Dictionary

func summon_item(parent: Node2D):
	var instance = object.instantiate()
	parent.add_child(instance)
	for property in object_properties.keys():
		instance.set(property, object_properties[property])
	return instance

func _process(delta):
	if not has_node("instance_object") and not object == null:
		var instance = summon_item(self)
		instance.name = "instance_object"
		instance.get_node("CollisionShape2D").disabled = true 
		
