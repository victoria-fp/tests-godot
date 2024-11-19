extends CharacterBody2D

var speed : float = 200

func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = moveDirection * speed
	
	if moveDirection.x > 0: # right
		$AnimatedSprite2D.flip_h = false	
	if moveDirection.x < 0: # left
		$AnimatedSprite2D.flip_h = true
	
	if moveDirection.x == 0 && moveDirection.y == 0 :
		$AnimatedSprite2D.play("Idle")
	else:
		$AnimatedSprite2D.play("Walk")


func _physics_process(delta):
	handleInput()
	move_and_slide()
