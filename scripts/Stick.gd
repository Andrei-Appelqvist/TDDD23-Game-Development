extends RigidBody2D
var Mouse_position

func _process(delta):
    Mouse_position = get_local_mouse_position()
    rotation += Mouse_position.angle()
