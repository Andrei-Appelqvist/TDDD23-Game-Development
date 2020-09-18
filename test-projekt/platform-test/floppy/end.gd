extends KinematicBody2D

var motion = Vector2()
var GRAVITY = 5
var BOUNCE = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

#func _process(delta):
    #motion.y += GRAVITY * delta
    #var collision = move_and_collide(motion)
    #if collision:
    #    motion.x -= cos(self.rotation_degrees + 90) * BOUNCE
    #    motion.y -= sin(self.rotation_degrees + 90) * BOUNCE
    #    print("motion", motion)
    #    move_and_collide(motion)
        
func _input(event):
    if event is InputEventMouseMotion:
        self.rotate(event.relative.x/100)

