extends TextureRect
var save_exists = true
var to_scene

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    var save_game = File.new()
    if not save_game.file_exists("user://savegame.save"):
        save_exists = false
        $Menu/HBoxContainer/VBoxContainer/Continue.modulate.a = 0.6
        
func Continue_gui_input(event):
    if event.is_action_pressed("jump") and save_exists:
        $"black-rect".fade(0.5, 0)
        to_scene = "res://scenes/Main.tscn"


func NewGame_gui_input(event):
    if event.is_action_pressed("jump"):
        if save_exists:
            $Menu/AcceptDialog.show()
        else:
            to_scene = "res://scenes/Intro.tscn"
            $"black-rect".fade(0.5,0)
   

func Quit_gui_input(event):
    if event.is_action_pressed("jump"):
        get_tree().quit()


func Credits_gui_input(event):
    if event.is_action_pressed("jump"):
        $"black-rect".fade(0.5,0)
        to_scene = "res://scenes/Credits.tscn"


func AcceptDialog_confirmed():
    var save_dir = Directory.new()
    save_dir.remove("user://savegame.save")
    $"black-rect".fade(0.5, 0)
    to_scene = "res://scenes/Intro.tscn"


func _on_blackrect_fade_complete():
    yield(get_tree().create_timer(1), "timeout")
    get_tree().change_scene(to_scene)
