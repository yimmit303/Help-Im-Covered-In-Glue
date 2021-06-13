extends RigidBody

#var jumping = false
#var JUMP_FORCE = 10
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#func _input(event):
#	if event is InputEventKey and event.pressed and event.is_echo() == false and event.get_scancode() == KEY_SPACE:
#		jumping = true
#
#func _integrate_forces(state):
#	if jumping:
#		self.apply_impulse(Vector3(0, 0, 0), get_node("Jump_Target").get_global_transform().origin * -1 * JUMP_FORCE)
#		jumping = false
var force_queue = []
var impulse_queue = []
var stuck = false

func _ready():
	pass

func _integrate_forces(state):
	for impulse in impulse_queue:
#		print("Jumping!!!")
#		get_node("../leg_attachment").detach()
		self.apply_impulse(impulse[0], impulse[1])
	impulse_queue.clear()

func _on_leg_Body_body_entered(body):
	if body is StaticBody:
#		print("Stuck!")
		get_parent().stuck = true
#		var new_joint = ConeTwistJoint.new()
#		new_joint.name = "leg_attachment"
#		new_joint.set_script(load("Player/leg_attachment.gd"))
#		get_parent().add_child(new_joint)
#		get_node("../leg_attachment").attach_to(self, body)
		
	
