extends RigidBody

var stuck_to_something = false
var on_cooldown = false
var stuck_timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "hit_something")

func _process(delta):
	if stuck_to_something or on_cooldown:
		stuck_timer += delta
	if stuck_to_something and stuck_timer >= 10.0:
		stuck_timer = 0.0
		self.stuck_to_something = false
		self.on_cooldown = true
		get_node("../" + self.name + "_pin_joint").detach()
	if on_cooldown and stuck_timer >= 1.0:
		stuck_timer = 0.0
		self.on_cooldown = false

func hit_something(body):
	if body is RigidBody and not stuck_to_something and not on_cooldown and not body.is_in_group("body_part"):
		stuck_to_something = true
		var new_joint = ConeTwistJoint.new()
		new_joint.name = self.name + "_pin_joint"
		new_joint.set_script(load("Player/leg_attachment.gd"))
		new_joint.set_translation(self.get_translation())
		get_parent().add_child(new_joint)
		get_node("../" + self.name + "_pin_joint").attach_to(self, body)
		get_node("../Splat").play()
