extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_SPEED = 400
const JUMP_HEIGHT = -900
const ACCELERATION = 50


var motion = Vector2()


func _physics_process(delta):

    
    motion.y += GRAVITY
    var friction = false
    if Input.is_action_pressed("ui_right"):
        motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
        $Sprite.flip_h = false
        $Sprite.play("Run")
    elif Input.is_action_pressed("ui_left"):
        motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
        $Sprite.flip_h = true
        $Sprite.play("Run")
    else:
        $Sprite.play("Idle")
        friction = true


    var look = Vector2()
    look = get_global_mouse_position()
    look_at(look)
    
    if is_on_floor():
        #if Input.is_action_just_pressed("ui_up"):
        #	motion.y = JUMP_HEIGHT
        
        var test = atan2(position.x - look.x, position.y - look.y)
        
        motion.y = JUMP_HEIGHT * sin(abs(test))
        motion.x = JUMP_HEIGHT*cos(abs(test))
        
        if friction == true:
            motion.x = lerp(motion.x, 0, 0.2)
    else:
        if motion.y < 0:
            $Sprite.play("Jump")
        else:
            $Sprite.play("Fall")
        if friction == true:
            motion.x = lerp(motion.x, 0, 0.05)		
    motion = move_and_slide(motion, UP)
    pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

    pass
