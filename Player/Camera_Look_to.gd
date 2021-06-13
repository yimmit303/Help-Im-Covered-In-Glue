extends Position3D

var MOVE_SPEED = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var offset = get_node("../body_Body").get_global_transform().origin - self.get_global_transform().origin
	self.translation += offset * 0.1
	print(offset)

func _input(event):
	if event is InputEventMouseMotion:
		self.rotation_degrees.y -= event.relative.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
