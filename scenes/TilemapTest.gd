extends Node2D

func _input(event):
    if event.is_action_pressed("ui_down"):
        get_tree().quit()

func _on_Platformdespawner_body_entered(body):
    if(get_tree().get_root().get_node('Node2D/Platform')):
        get_tree().get_root().get_node('Node2D/Platform').free()

func _on_Fallholderdespawner_body_entered(body):
    if(get_tree().get_root().get_node('Node2D/Fall-holder')):
        get_tree().get_root().get_node('Node2D/Fall-holder').free()

func _on_Area2D_body_entered(body):
    print(body)
    if get_tree().get_root().get_node("Main/player/control").frozen == false: 
        get_tree().get_root().get_node("Main/player/control").frozen = true
        get_node("Birb/AnimationPlayer").play("birb")
        $AudioStreamPlayer2D.play()

func _on_Birb_body_entered(body):
    get_parent().get_node("player").follow_birb = true
    get_node("END-CAMERA").current = true
    get_node("end-text").fade(3, 0)
    get_node("black-rect").fade(3,0)

func _on_blackrect_fade_complete():
    get_tree().change_scene("res://scenes/credits_cutscene.tscn")
