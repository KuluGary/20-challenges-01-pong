extends Area2D
class_name Ball

@export var speed = 0.75
var dir = Vector2(-1, 0)

@onready var collision_sound: AudioStreamPlayer2D = get_node("SFX/BumpSound")
@onready var score_sound: AudioStreamPlayer2D = get_node("SFX/ScoreSound")

func _physics_process(delta):
	global_position += dir * speed
	speed += 0.01

func _change_direction(body):
	if not body is Ball:
		collision_sound.play()
		if body is Paddle:
			var new_dir = global_position.direction_to(body.global_position)
			dir = -new_dir
		else:
			dir = Vector2(dir.x, -dir.y)

func _on_body_entered(body):
	_change_direction(body)
	
func _on_area_entered(area):
	if area is ScoreGoal:
		score_sound.play()
		speed = 0.75
		dir = Vector2(-1, 0)
		global_position = get_viewport_rect().size / 2.0
