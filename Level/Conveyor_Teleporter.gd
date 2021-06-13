extends Area

export(Vector3) var offset

func _ready():
	self.connect("body_entered", self, "entered")


func entered(body):
	if body is RigidBody and not body.is_in_group("body_part"):
		print("body entered")
		body.mode = 3
		body.set_translation(body.get_translation() + offset) 
		body.mode = 0
