extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 30
const MAX_SPEED = 500
const BOUNCESPEED = 200
const ACCELERATION = 50
var motion = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    motion.y += GRAVITY
    var mouse = get_global_mouse_position()
    look_at(mouse)
    if abs(motion.x) > MAX_SPEED:
        motion.x = MAX_SPEED * (motion.x / abs(motion.x))
    if abs(motion.y) > MAX_SPEED:
        motion.y = MAX_SPEED * (motion.y / abs(motion.y))
    var collision = move_and_collide(motion * delta)
    if collision:
      
        var normal = collision.normal
       
        var reflect = collision.remainder.bounce(normal)
        motion = motion.bounce(normal)
        print(reflect)
        print(motion)
        motion.x += BOUNCESPEED * cos(rotation)
        motion.y += BOUNCESPEED * sin(rotation) *2
        move_and_collide(reflect)
        
