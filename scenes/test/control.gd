extends RigidBody2D
var desired_rotation = 0
    
func _input(event):
    if event is InputEventMouseMotion:
        desired_rotation += event.relative.x
func _integrate_forces(state):
    state.angular_velocity = desired_rotation
    desired_rotation = 0
