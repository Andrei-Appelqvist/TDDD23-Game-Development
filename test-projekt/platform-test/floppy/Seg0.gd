extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse = get_global_mouse_position()


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _integrate_forces(state):
    var new_mouse = get_global_mouse_position()
    var speed = mouse.x - new_mouse.x
    state.angular_velocity = speed * -1
    mouse = new_mouse
#    pass
