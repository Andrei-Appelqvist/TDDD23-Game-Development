extends RigidBody2D
func _integrate_forces(state):
    if (self.rotation_degrees > 30):
        state.angular_velocity = self.angular_velocity * -1
        angular_damp = 30
    elif (self.rotation_degrees < -30):
        state.angular_velocity = self.angular_velocity * -1
        angular_damp = 30
    else:
        angular_damp = abs(self.rotation_degrees)
        
    #var pr = self.get_parent().get_parent().rotation_degrees
    state.angular_velocity -= (100 *self.rotation_degrees/90)
