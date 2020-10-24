extends Node2D

var velocity = Vector2()
var follow_birb = false
var camera_done = false
var current_song = 0

var music_list = {0 : "res://assets/audio/plank-pose.ogg",
    1 : "res://assets/audio/Brass-Laterns.ogg",
    2 : "res://assets/audio/Skwun.ogg",
    3 : "res://assets/audio/deepwoods.ogg"}

func set_start_speed(velocity):
    $control.apply_impulse(Vector2(),velocity)

func _ready():
    
    play_song(current_song, true)

func save():
    var global_vars = get_node("/root/GlobalVariables")
    var save_dict = {
        "filename" : get_filename(),
        "parent" : get_parent().get_path(),
        "pos_x" : $control.global_position.x,
        "pos_y" : $control.global_position.y,
        "rotation": $control.global_rotation_degrees,
        "force_x": velocity.x,
        "force_y": velocity.y,
        "music" : current_song,
        "volume" : global_vars.volume,
        "mouse" : global_vars.mouse
    }
    print(save_dict)
    return save_dict

func play_song(list_index, override = false):
    if current_song != list_index || override:
        current_song = list_index
        $FadeOutTween.interpolate_property($control/music_player, "volume_db", 0, -80, 3, 1, Tween.EASE_IN, 0)
        $FadeOutTween.start()

func _process(delta):
    if follow_birb == true:
        if camera_done == false:

            get_parent().get_node("END").position = get_parent().get_node("player/control/Camera2D").global_position
            camera_done = true

        $control.global_position = get_parent().get_node("END/Birb").global_position


func _on_Tween_tween_all_completed():
    $control/music_player.stop()
    var song = load(music_list[current_song])
    $control/music_player.stream = song
    $control/music_player.volume_db = 0
    $control/music_player.play()
