extends StaticBody

var bodys_on = []
export var force = Vector3(0,0,10)

func _ready():
	force = force.rotated(Vector3(0, 1, 0), deg2rad(self.rotation_degrees.y))
	

func _process(delta):
	for body in bodys_on:
		body.add_force(force, Vector3(0,0,0))

func _on_Conveyor_Area_body_entered(body):
	if body is RigidBody:
		print(self.name)
		print("area entered")
		bodys_on.append(body)

func _on_Conveyor_Area_body_exited(body):
	if body is RigidBody:
		bodys_on.remove(bodys_on.find(body))
