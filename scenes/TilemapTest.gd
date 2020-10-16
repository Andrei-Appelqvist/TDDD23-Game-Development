extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("ui_down"):
		get_tree().quit()


func _on_Platformdespawner_body_entered(body):
	if(get_tree().get_root().get_node('Node2D/Platform')):
		get_tree().get_root().get_node('Node2D/Platform').free()
	pass # Replace with function body.


func _on_Fallholderdespawner_body_entered(body):
	if(get_tree().get_root().get_node('Node2D/Fall-holder')):
		get_tree().get_root().get_node('Node2D/Fall-holder').free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	print(body)
	if get_node("player/control").frozen == false:
		get_node("player/control").frozen = true
		get_node("Birb/AnimationPlayer").play("birb")
	pass # Replace with function body.


func _on_Birb_body_entered(body):
	get_node("player").follow_birb = true
	get_node("END-CAMERA").current = true
	print("Fuck yeah!")
	pass # Replace with function body.
