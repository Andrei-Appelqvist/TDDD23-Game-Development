extends Node2D
func _on_Platformdespawner_body_entered(body):
    if(get_node("Platform")):
        get_node("Platform").free()

func _on_Fallholderdespawner_body_entered(body):
    if(get_node("Fall-holder")):
        get_node("Fall-holder").free()

