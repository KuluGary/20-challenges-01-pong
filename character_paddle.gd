extends Paddle
class_name CharacterPaddle

func _physics_process(delta):
	velocity = Vector2(velocity.x, global_position.direction_to(get_global_mouse_position()).y) * speed

	if global_position.distance_to(target) > 5:
		move_and_slide()
