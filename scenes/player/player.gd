extends Node2D

var velocity = Vector2()
func set_start_speed(velocity):
    $control.apply_impulse(Vector2(),velocity)

func save():
    var save_dict = {
        "filename" : get_filename(),
        "parent" : get_parent().get_path(),
        "pos_x" : $control.global_position.x,
        "pos_y" : $control.global_position.y,
        "rotation": $control.global_rotation_degrees,
        "force_x": velocity.x,
        "force_y": velocity.y,
    }
    print(save_dict)
    return save_dict
