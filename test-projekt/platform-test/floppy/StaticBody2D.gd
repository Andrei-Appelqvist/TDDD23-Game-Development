extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
    
func _integrate_forces(state):
    if (self.rotation_degrees > 30):
        self.rotation_degrees = 30
        state.angular_velocity = self.angular_velocity/2 * -1
    elif (self.rotation_degrees < -30):
        self.rotation_degrees = -30
        state.angular_velocity = self.angular_velocity/2 * -1
        
    #var pr = self.get_parent().get_parent().rotation_degrees
    state.angular_velocity = (10 *self.rotation_degrees/360)
    """if (self.name == "Seg1"):
        print("av", self.angular_velocity)
        print("pr", pr)
        print("sr", self.rotation_degrees)
"""
