extends RigidBody2D

var ROTATION_SPEED = 5
var desire_rotation = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(event):
	if event.is_action_pressed("jump"):
		desire_rotation = true
	elif event.is_action_released("jump"):
		desire_rotation = false
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	if desire_rotation:
		if abs(rotation) > 1:
			angular_velocity = ROTATION_SPEED * rotation_degrees/90
		else:
			angular_velocity = 0
			angular_damp = 1000
	else:
		angular_damp = 8
