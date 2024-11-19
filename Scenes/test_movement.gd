extends CharacterBody2D

var speed : float = 200

func _process(delta: float) -> void:
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = moveDirection * speed
	
	if moveDirection.x > 0: # right
		$AnimatedSprite2D.flip_h = false	
	if moveDirection.x < 0: # left
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()
