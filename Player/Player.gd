extends Spatial


var jumping = false
var JUMP_FORCE = 50
var leg
var body
var stuck = false

# Called when the node enters the scene tree for the first time.
func _ready():
	leg = get_node("leg_Body")
	body = get_node("body_Body")
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed and event.is_echo() == false and event.get_scancode() == KEY_SPACE:
		self.stuck = false
		var jump_direction = get_node("leg_Body/Jump_Target").get_global_transform().origin - get_node("leg_Body").get_global_transform().origin
		leg.impulse_queue.append([Vector3(0, 0, 0), jump_direction * 1 * JUMP_FORCE])
		body.impulse_queue.append([Vector3(0, 0, 0), jump_direction * -1 * JUMP_FORCE])
	
