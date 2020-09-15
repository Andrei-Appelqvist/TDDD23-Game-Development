extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var UP = Vector2(0,1)
	#var ang = self.get_node("PinJoint2D/RigidBody2D").angular_velocity
	"""
	if self.get_node("PinJoint2D/RigidBody2D").angular_velocity > 0.3:
		self.get_node("PinJoint2D/RigidBody2D").angular_velocity -= 0.01
	elif self.get_node("PinJoint2D/RigidBody2D").angular_velocity < -0.3:
		self.get_node("PinJoint2D/RigidBody2D").angular_velocity += 0.01
	"""
	var degrees = self.rotation_degrees
	var pd = self.get_parent().get_parent().rotation_degrees
	var f = pd - degrees
	print(f)
	self.angular_velocity = (10 * f / 36)
	
	"""if degrees < -10:
		#self.get_node("PinJoint2D/RigidBody2D").global_rotation_degrees += 0.1
		self.get_node("PinJoint2D/RigidBody2D").angular_velocity += 0.07
	elif degrees > 10:
		self.get_node("PinJoint2D/RigidBody2D").angular_velocity -= 0.07
	elif degrees > 25:
		self.get_node("PinJoint2D/RigidBody2D").angular_velocity -= 0.5
		#self.get_node("PinJoint2D/RigidBody2D").global_rotation_degrees -= 0.1
	else:
		self.get_node("PinJoint2D/RigidBody2D").angular_velocity = 0"""
	pass
