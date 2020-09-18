extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _integrate_forces(state):
    if (self.rotation_degrees > 30):
        state.angular_velocity = self.angular_velocity * -1
        angular_damp = 300
    elif (self.rotation_degrees < -30):
        state.angular_velocity = self.angular_velocity * -1
        angular_damp = 300
    else:
        angular_damp = 3
        #angular_damp = abs(self.rotation_degrees)

    #var pr = self.get_parent().get_parent().rotation_degrees
    state.angular_velocity -= (100 *self.rotation_degrees/90)
