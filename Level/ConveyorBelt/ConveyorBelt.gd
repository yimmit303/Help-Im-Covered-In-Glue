extends StaticBody

var bodys_on = []
export var force = Vector3(0,0,10)

func _ready():
	force = ($Direction.get_global_transform().origin - self.global_transform.origin).normalized() * 10
	

func _process(delta):
	for body in bodys_on:
		body.add_force(force, Vector3(0,0,0))

func _on_Conveyor_Area_body_entered(body):
	if body is RigidBody:
		bodys_on.append(body)

func _on_Conveyor_Area_body_exited(body):
	if body is RigidBody:
		bodys_on.remove(bodys_on.find(body))
