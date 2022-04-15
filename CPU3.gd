extends KinematicBody2D
signal game_stopc
signal win
const ANGLE_THRESHOLD = 0.7
const DANGER_ZONE_RADIUS = 200
const RANDOM_MOVE_PROB = 0.3
onready var Tweenie = $Tween
onready var PointsUI = get_tree().get_current_scene().get_node("Score2")
enum {
	GOUP,
	GODOWN,
	IDLE
}
var state = IDLE
var points = 0
var speed = 13
onready var ball = get_tree().get_current_scene().get_node("Ball")
onready var rayfaker = $rayfaker
func _process(delta):
	PointsUI.text.text = str(points)
	if Paused.paused == false:
		if points == 3:
			emit_signal("win")
func _physics_process(delta):
	if Paused.paused == false:
		if not in_danger():
			state = IDLE
		else:
			move()

	# Random movement
		if state == IDLE:
			if rand_range(0, 1) < RANDOM_MOVE_PROB:
				move()

		match state:
			GOUP:
				position.y -= speed
				if position.y <= 72:
					position.y += speed
			GODOWN:
				position.y += speed
				if position.y >= 452:
					position.y -= speed


func in_danger():
	if Paused.paused == false:
		var angle = ball.velocity.angle() - (position - ball.position).angle()
		return abs(angle) <= ANGLE_THRESHOLD and position.distance_to(ball.position) <= DANGER_ZONE_RADIUS


# This is what you must improve
func move():
	if Paused.paused == false:
		var vel = ball.velocity
	# If on the edges and in danger lets just move
		if position.y >= ball.B_HEIGHT:
			state = GOUP
		elif position.y <= 0:
			state = GODOWN
		elif vel.y > 0: # Ball is going down
			if vel.x >= 0: # Comming at you
				state = GOUP
			else: # Comming from behind
				state = GODOWN
		elif vel.y <= 0: # Ball is going up
			if vel.x >= 0: # Comming at you
				state = GODOWN
			else: # Comming from behind
				state = GOUP
		else:  # ?
			state = GODOWN


func _on_rayfaker_area_entered(_area):
	pass

func _on_rayfaker_area_exited(_area):
	pass


func _on_Area2D_area_entered(area):
	Tweenie.interpolate_property(self,"modulate",Color(0,0,0,255), Color(0,0,0,0),22,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	Tweenie.start()
	emit_signal("game_stopc")
