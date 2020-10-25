extends VideoPlayer
    
func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    $"black-rect".modulate.a = 1
    $"black-rect".fade(1,1)
    
func _input(event):
    if event.is_action_pressed("ui_cancel"):
        stop()
        $"black-rect".fade(1,0)

func _on_VideoPlayer_finished():
    var save_dir = Directory.new()
    save_dir.remove("user://savegame.save")
    get_tree().change_scene("res://scenes/Main.tscn")

func blackrect_fade_complete():
    print('complete')
    if $"black-rect".modulate.a == 1:
        print('full')
        yield(get_tree().create_timer(1.0), "timeout")
        get_tree().change_scene("res://scenes/Main.tscn")  
