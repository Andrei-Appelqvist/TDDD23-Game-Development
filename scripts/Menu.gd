extends MarginContainer
var save_exists = true

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    var save_game = File.new()
    if not save_game.file_exists("user://savegame.save"):
        save_exists = false
        $HBoxContainer/VBoxContainer/Continue.modulate.a = 0.6
        
func _on_Continue_gui_signal(event):
    if event.is_action_pressed("jump") and save_exists:
        get_node("HBoxContainer/VBoxContainer/Continue").add_color_override("Red", Color.red)
        get_tree().change_scene("res://scenes/Main.tscn")


func NewGame_gui_input(event):
    if event.is_action_pressed("jump"):
        if save_exists:
            $AcceptDialog.show()
        else:
            get_tree().change_scene("res://scenes/newgame_cutscene.tscn")
    pass # Replace with function body.


func Quit_gui_input(event):
    if event.is_action_pressed("jump"):
        get_tree().quit()


func Credits_gui_input(event):
    pass # Replace with function body.


func AcceptDialog_confirmed():
    var save_dir = Directory.new()
    save_dir.remove("user://savegame.save")
    get_tree().change_scene("res://scenes/newgame_cutscene.tscn")
