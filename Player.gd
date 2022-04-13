extends KinematicBody2D
var speed = 5
func _process(delta):
	if Input.get_action_strength("ui_up"):
		position.y -= speed
	if Input.get_action_strength("ui_down"):
		position.y += speed
	if position.y >= 420:
		position.y -= speed
	if position.y <= 0:
		position.y += speed
