extends KinematicBody2D

const B_HEIGHT = 460
const B_WIDTH = 700
var SPEED = 9

export var initial_angle = 45  # in degrees
var rng = RandomNumberGenerator.new()

var velocity = Vector2.ONE
func _ready():
	rng.randomize()
	var angle = deg2rad(initial_angle)
	velocity = Vector2(cos(angle), sin(angle)) * SPEED


func _process(_delta):
	if Paused.paused == false:
		clamp(SPEED,7,12)
		print(SPEED)
		position.x += velocity.x
		position.y += velocity.y
		if position.y >= B_HEIGHT:
			velocity.y = -SPEED-rand_range(1, 3)
		if position.y <= 0:
			velocity.y = SPEED+rand_range(1, 3)
		if position.x >= B_WIDTH:
			velocity.x = -SPEED-rand_range(1, 3)
		if position.x <= 0:
			velocity.x = SPEED+rand_range(1, 3)
