extends MarginContainer

func _ready():
    $"HBoxContainer/VBoxContainer/Volume/Slider-Volume".value = GlobalVariables.volume
    $"HBoxContainer/VBoxContainer/Mouse/Slider-Mouse".value = GlobalVariables.mouse
    
func SliderMouse_value_changed(value):
    GlobalVariables.mouse = value


func SliderVolume_value_changed(value):
    GlobalVariables.volume = value
    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
        
func Menu_visibility_changed():
    print(self.rect_position)
    if visible:
        var vtrans = get_canvas_transform()
        var top_left = -vtrans.get_origin() / vtrans.get_scale()
        var vsize = get_viewport_rect().size
        self.rect_position = top_left + 0.5*vsize/vtrans.get_scale()
        self.rect_position.x -= 460
        self.rect_position.y -= 240
        print(self.rect_position)
        $"HBoxContainer/VBoxContainer/Volume/Slider-Volume".value = GlobalVariables.volume
        $"HBoxContainer/VBoxContainer/Mouse/Slider-Mouse".value = GlobalVariables.mouse


func Resume_gui_input(event):
    if event.is_action_pressed("jump"):
        visible = false
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
        get_tree().paused = false


func Menu_gui_input(event):
    if event.is_action_pressed("jump"):
        get_tree().paused = false
        get_tree().change_scene("res://scenes/färdiga_scener/Menu.tscn")
