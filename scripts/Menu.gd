extends MarginContainer
var save_exists = true

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    var save_game = File.new()
    if not save_game.file_exists("user://savegame.save"):
        save_exists = false
        
        
    
func _on_Continue_gui_signal(event):
    if event.is_action_pressed("jump") and save_exists:
        get_node("HBoxContainer/VBoxContainer/Continue").add_color_override("Red", Color.red)
        get_tree().change_scene("res://scenes/Main.tscn")
