extends Position3D

var MOVE_SPEED = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var offset = get_node("../body_Body").get_global_transform().origin - self.get_global_transform().origin
	self.translation += offset * 0.1

func _input(event):
	if event is InputEventMouseMotion:
		event.relative *= 0.521
		self.rotation_degrees.y -= event.relative.x
		if event.relative.y < 0 and self.rotation_degrees.x > -30:
			self.rotation_degrees.x += event.relative.y
		if event.relative.y > 0 and self.rotation_degrees.x < 50:
			self.rotation_degrees.x += event.relative.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
