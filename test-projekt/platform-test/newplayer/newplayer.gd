extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 10
const MAX_SPEED = 600
const BOUNCESPEED = 200
const ACCELERATION = 50
var motion = Vector2()
var bottomFirst = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    $bottomSquare.connect("body_entered", self, "_on_Area2D_body_entered")
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

        if(bottomFirst):
            motion.x += BOUNCESPEED * cos(rotation) * 20
            motion.y += BOUNCESPEED * sin(rotation) 
        
        move_and_collide(reflect)
        

func _on_bottomSquare_body_entered(body):
    if not body.get_name() == 'playa':
        bottomFirst = true
        print("true")
    pass # Replace with function body.


func _on_bottomSquare_body_exited(body):
    if body.get_name() == 'TileMap':
        bottomFirst = false
        #print("false")
    pass # Replace with function body.
