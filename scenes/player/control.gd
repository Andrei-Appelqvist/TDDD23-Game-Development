extends RigidBody2D
var desired_rotation = 0

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
    if event is InputEventMouseMotion:
        desired_rotation += event.relative.x
        

func _integrate_forces(state):
    if abs(desired_rotation) > 10:
        var negation = 1
        if desired_rotation < 0:
            negation = -1
        desired_rotation = 10 * negation
    state.angular_velocity = desired_rotation
    desired_rotation = 0
