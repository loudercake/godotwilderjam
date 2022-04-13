extends KinematicBody2D
var xdir = 1
var ydir = 1
var vel = 7

func _process(delta):
	position.x += xdir * vel
	position.y += ydir * vel
	if position.y >= 460:
		ydir = -1
	if position.y <= 0:
		ydir = 1
	if position.x >= 700:
		xdir = -1
	if position.x <= 0:
		xdir = 1
