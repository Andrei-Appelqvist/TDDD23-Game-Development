extends RigidBody2D


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
	if (abs(self.rotation_degrees) < 3):
		mult = 0
	#elif (self.rotation_degrees < -30):
		#angular_damp = 300
		
	state.angular_velocity = self.rotation_degrees/90 * mult
	#var pr = self.get_parent().get_parent().rotation_degrees
	#state.angular_velocity -= (400 *self.rotation_degrees/90)
