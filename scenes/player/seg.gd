extends RigidBody2D

var ROTATION_SPEED = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	var mult = 0.5
	if (abs(self.rotation_degrees) > 30):
		mult = 5
		#angular_velocity -= ROTATION_SPEED * mult * rotation_degrees/360
	if (abs(self.rotation_degrees) < 3):
		mult = 0
	#else:
		#angular_velocity -= ROTATION_SPEED * mult * rotation_degrees/360
