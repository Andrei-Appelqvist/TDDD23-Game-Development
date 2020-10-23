extends VideoPlayer
    
func _input(event):
    if event.is_action_pressed("ui_cancel"):
        get_tree().change_scene("res://scenes/Main.tscn")  
        
func _on_VideoPlayer_finished():
    get_tree().change_scene("res://scenes/Main.tscn")
