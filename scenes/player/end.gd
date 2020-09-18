extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 10
const MAX_SPEED = 600
const BOUNCESPEED = 200
const ACCELERATION = 50
var motion = Vector2()
var bottomFirst = false

func _input(event):
    if event is InputEventMouseMotion:
        self.rotate(event.relative.x/100)

func _process(delta):
    motion.y += GRAVITY
    if abs(motion.x) > MAX_SPEED:
        motion.x = MAX_SPEED * (motion.x / abs(motion.x))
    if abs(motion.y) > MAX_SPEED:
        motion.y = MAX_SPEED * (motion.y / abs(motion.y))
    var collision = move_and_collide(motion * delta)
    if collision:

        var normal = collision.normal

        var reflect = collision.remainder.bounce(normal)
        motion = motion.bounce(normal)

        if bottomFirst:
            motion.x += BOUNCESPEED * cos(rotation) * 20
            motion.y += BOUNCESPEED * sin(rotation)

        move_and_collide(reflect)


func _on_Area2D_body_entered(body):
    if not body is RigidBody2D:
        bottomFirst = true



func _on_Area2D_body_exited(body):
     if not body is RigidBody2D:
        bottomFirst = false
