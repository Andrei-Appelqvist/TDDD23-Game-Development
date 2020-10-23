extends Node2D

var velocity = Vector2()
var follow_birb = false
var camera_done = false
var current_song = 0
var music_list = {}

func set_start_speed(velocity):
    $control.apply_impulse(Vector2(),velocity)
    
func _ready():
    music_list[0] = "res://assets/audio/plank-pose.ogg"
    music_list[1] = "res://assets/audio/tmp_music/Jepyang - Jagnype - 05 Brass Lanterns.wav"
    play_song(current_song, true)
    
func save():
    var save_dict = {
        "filename" : get_filename(),
        "parent" : get_parent().get_path(),
        "pos_x" : $control.global_position.x,
        "pos_y" : $control.global_position.y,
        "rotation": $control.global_rotation_degrees,
        "force_x": velocity.x,
        "force_y": velocity.y,
        "music" : current_song,
    }
    print(save_dict)
    return save_dict

func play_song(list_index, override = false):
    if current_song != list_index || override:
        current_song = list_index
        $control/music_player.stop()
        var song = load(music_list[list_index])
        current_song = list_index
        $control/music_player.stream = song
        $control/music_player.play()

func _process(delta):
    if follow_birb == true:
        if camera_done == false:
            
            get_parent().get_node("END").position = get_parent().get_node("player/control/Camera2D").global_position
            camera_done = true
            
        $control.global_position = get_parent().get_node("END/Birb").global_position
