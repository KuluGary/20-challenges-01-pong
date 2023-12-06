extends Area2D
class_name ScoreGoal

@export var point_counter: Label

func _on_area_entered(area):
	if area is Ball:
		point_counter.text = str(int(point_counter.text) + 1)
