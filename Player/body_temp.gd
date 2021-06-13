extends RigidBody
export(NodePath) var debugger_path
	
var force_queue = []
var impulse_queue = []

var self_up
#var true_up

var righting_direction
var righting_force
var RIGHTING_STRENGTH = 50

var AIM_STRENGTH = 5
var AIM_STRENGTH_SCALE = 1.0

func _ready():
	var debugger = get_node(debugger_path)
	self_up = $self_up.get_global_transform().origin - self.get_global_transform().origin
#	true_up = get_node("../Up").get_global_transform().origin - self.get_global_transform().origin 
#	righting_direction = true_up - self_up
#	righting_force = righting_direction * RIGHTING_STRENGTH
#	debugger.vectors.append(debugger.Vector.new(self, "linear_velocity", 1.0, 8.0, Color(0, 1, 0, 1)))
#	debugger.vectors.append(debugger.Vector.new(self, "righting_direction", RIGHTING_STRENGTH, 5.0, Color(1, 1, 1, 1)))
#	debugger.vectors.append(debugger.Vector.new(self, "righting_direction", 1.0, 2.0, Color(0, 0, 0, 1)))
#	debugger.vectors.append(debugger.Vector.new(self, "gravity_force", 1.0, 2.0, Color(1, 1, 0, 1)))

func _integrate_forces(state):
	AIM_STRENGTH_SCALE = 1.0
	if get_parent().stuck == true:
		self_up = ($self_up.get_global_transform().origin - self.get_global_transform().origin).normalized()
		var true_up = Vector2(0, 1)
		var x_angle = true_up.angle_to(Vector2(self_up.x, self_up.y))
		var z_angle = true_up.angle_to(Vector2(self_up.z, self_up.y))
		var righting_force = Vector3(z_angle, 0, -x_angle) * RIGHTING_STRENGTH
		self.add_torque(righting_force)
		AIM_STRENGTH_SCALE = 2.0
	
	
	var dir = Vector3(0, 0, 0)
	var cam_xform = get_node("../Camera_Look_to").get_global_transform()
	
	if Input.is_action_pressed("MOVE_FORWARD"):
		dir += cam_xform.basis[0]
	if Input.is_action_pressed("MOVE_BACKWARDS"):
		dir += -cam_xform.basis[0]
	if Input.is_action_pressed("MOVE_LEFT"):
		dir += -cam_xform.basis[2]
	if Input.is_action_pressed("MOVE_RIGHT"):
		dir += cam_xform.basis[2]
	dir = dir.normalized()
	var aim_force = dir * AIM_STRENGTH * AIM_STRENGTH_SCALE
	self.add_torque(aim_force)
	
	for impulse in impulse_queue:
		self.apply_impulse(impulse[0], impulse[1])
	impulse_queue.clear()
