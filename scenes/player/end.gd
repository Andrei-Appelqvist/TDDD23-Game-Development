extends KinematicBody2D
func _input(event):
    if event is InputEventMouseMotion:
        self.rotate(event.relative.x/100)
