extends CharacterBody2D
class_name Paddle

@onready var timer: Timer = get_node("Timer")
@export var ball: Ball
var target = Vector2.ZERO
var speed = 150
var wait_time = { min = 0.25, max = 1.25 }

func _physics_process(delta):
	velocity = Vector2(velocity.x, global_position.direction_to(target).y) * speed
	
	if global_position.distance_to(target) > 5:
		move_and_slide()

func _on_timer_timeout():
	var new_time = randf_range(wait_time.min, wait_time.max)
	timer.set_wait_time(new_time)
	
	if ball:
		target = ball.global_position
