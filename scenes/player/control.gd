extends RigidBody2D
var desired_rotation = 0
var rotation_mult = 1.0
var frozen = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and frozen == false:
		desired_rotation += event.relative.x * rotation_mult
	elif event.is_action_pressed("ui_down"):
		rotation_mult -= 0.1
	elif event.is_action_pressed("ui_up"):
		rotation_mult += 0.1
		

func _integrate_forces(state):
	get_parent().velocity = state.get_linear_velocity()
	if abs(desired_rotation) > 10:
		var negation = 1
		if desired_rotation < 0:
			negation = -1
		desired_rotation = 8 * negation
		if abs(desired_rotation) > 360:
			desired_rotation = 360 * negation
	state.angular_velocity = desired_rotation 
	desired_rotation = 0
