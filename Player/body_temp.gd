extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	self.rotation_degrees += Vector3(0, 1, 0) *  rotation_dir * 60 * delta
	
