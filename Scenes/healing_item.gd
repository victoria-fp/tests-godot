extends Area2D



func _on_body_entered(body: Node2D) -> void:
	body.bell_sound()
	queue_free()
