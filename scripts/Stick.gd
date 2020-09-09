extends Node2D
var Mouse_position


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
    Mouse_position = get_local_mouse_position()
    rotation += Mouse_position.angle()
    print("asf")
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
