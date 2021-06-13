extends Area

func _ready():
	self.connect("body_entered", self, "entered")


func entered(body):
	if body is RigidBody and body.is_in_group("body_part"):
		get_tree().change_scene("TheEnd.tscn")
