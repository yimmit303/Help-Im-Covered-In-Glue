extends RigidBody
export(NodePath) var target_path
export(NodePath) var debugger_path
var target_pos
var force_direction
var PULL_STRENGTH = 100
var PULL_EXP = 1
var gravity_force

# Called when the node enters the scene tree for the first time.
func _ready():
	var debugger = get_node(debugger_path)
	target_pos = get_node(target_path).get_global_transform().origin
	force_direction = target_pos - self.get_translation()
	debugger.vectors.append(debugger.Vector.new(self, "linear_velocity", 1.0, 8.0, Color(0, 1, 0, 1)))
	debugger.vectors.append(debugger.Vector.new(self, "force_direction", PULL_STRENGTH, 5.0, Color(1, 1, 1, 1)))
	debugger.vectors.append(debugger.Vector.new(self, "force_direction", 1.0, 2.0, Color(0, 0, 0, 1)))

func _integrate_forces(state):
	target_pos = get_node(target_path).get_global_transform().origin
	force_direction = target_pos - self.get_global_transform().origin
	add_force(force_direction * PULL_STRENGTH, Vector3(0, 0, 0))
	add_force(Vector3(0, -1, 0) * 0.8, get_node("arm_center").get_translation())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
