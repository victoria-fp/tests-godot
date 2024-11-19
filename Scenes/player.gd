extends CharacterBody2D

var speed : float = 200
var punch = false

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
		
	if Input.is_action_just_pressed("ui_accept") :
		$AnimatedSprite2D.play("Punch")

		
	#if Input.is_action_just_pressed("ui_accept") and $AnimatedSprite2D.flip_h == false and punch == false :
		#$AnimatedSprite2D.play("Punch")
		#for body in $RightFist.get_overlapping_bodies():
			#if(body.get_collision_layer() == 2):
				#body.hurt()
				#punch = true
	#elif Input.is_action_just_pressed("ui_accept") and $AnimatedSprite2D.flip_h == true and punch == false :
		#$AnimatedSprite2D.play("Punch")
		#for body in $LeftFist.get_overlapping_bodies():
			#if(body.get_collision_layer() == 2):
				#body.hurt()
				#punch = true
	#else:
		#punch = false


func _physics_process(delta):
	handleInput()
	move_and_slide()



func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("Idle")
	punch = false
