extends Control
export(NodePath) var player
export(NodePath) var camera

class Vector:
	var object  # The node to follow

	var property  # The property to draw

	var scale  # Scale factor

	var width  # Line width

	var color  # Draw color


	func _init(_object, _property, _scale, _width, _color):
		object = _object
		property = _property
		scale = _scale
		width = _width
		color = _color

	func draw(node, camera):
		var start = camera.unproject_position(object.global_transform.origin)
		var end = camera.unproject_position(object.global_transform.origin + object.get(property) * scale)
		node.draw_line(start, end, color, width)
#		node.draw_triangle(end, start.direction_to(end), width*2, color)

var vectors = []

func _process(delta):
	if not visible:
		return
	update()

func _draw():
	var camera = get_viewport().get_camera()
	for vector in vectors:
		vector.draw(self, camera)
