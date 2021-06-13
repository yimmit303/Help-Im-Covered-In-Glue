extends Area

var bodys_on = []

func _on_Conveyor_Area_body_entered(body):
	print("body on conveyor!!")
	if body is RigidBody:
#		body.add_force(Vector3(0,0,5), Vector3(0,0,0))
		bodys_on.append(body)

