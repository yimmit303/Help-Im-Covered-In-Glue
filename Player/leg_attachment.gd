extends ConeTwistJoint


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func attach_to(node1, node2):
	self.set("nodes/node_a", get_path_to(node1))
	self.set("nodes/node_b", get_path_to(node2))
	
func detach():
	self.queue_free()
