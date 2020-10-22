extends Node2D

var velocity = Vector2()
var follow_birb = false
var camera_done = false
var current_area = 0
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
		"music" : current_area,
	}
	print(save_dict)
	return save_dict

func _process(delta):
	if follow_birb == true:
		if camera_done == false:
			get_parent().get_node("END-CAMERA").position = $control/Camera2D.global_position
			camera_done = true
		position = get_parent().get_node("Birb").global_position + Vector2(-1000, -400)
