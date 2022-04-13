extends KinematicBody2D

enum {
	GOUP,
	GODOWN,
	IDLE
}
var state = IDLE
var speed = 8
onready var ball = get_tree().get_current_scene().get_node("Ball")
onready var rayfaker = $rayfaker
func _process(delta):
	if position.y < 180:
		rayfaker.position.y = -80
	elif position.y < 180:
		rayfaker.position.y = 80
	match state:
		GOUP:
			position.y -= speed
			if position.y <= 72:
				position.y += speed
		GODOWN:
			position.y += speed
			if position.y >= 452:
				position.y -= speed




func _on_rayfaker_area_entered(area):
		if ball.ydir == -1:
			if ball.position.y < position.y:
				if position.y > 240:
					state = GOUP
				else:
					state = IDLE
			elif ball.position.y > position.y:
				if position.y > 240:
					state = GOUP
				else:
					state = GODOWN
		elif ball.ydir == 1:
			if ball.position.y < position.y:
				if position.y > 240:
					state = GODOWN
				else:
					state = IDLE
			elif ball.position.y > position.y:
				if position.y > 240:
					state = IDLE
				else:
					state = GODOWN


func _on_rayfaker_area_exited(area):
	state = IDLE
