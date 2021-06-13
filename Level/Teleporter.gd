extends Area

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "entered")
	pass # Replace with function body.


func entered(body):
	if body.is_in_group("body_part"):
		get_tree().reload_current_scene()
