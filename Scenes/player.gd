extends CharacterBody2D

var speed : float = 200
var punch = false

func handleInput():
	var moveDirection = Input.get_vector("left","right","up","down")
	velocity = moveDirection * speed
	
	# Gestion du coup de poing 
	if Input.is_action_just_pressed("punch") :
		punch = true
		$AnimatedSprite2D.play("Punch")
		$AudioStreamPlayer2D.play()
	
	# Gestion du déplacement
	elif not Input.is_action_just_pressed("punch") and punch == false :
		if moveDirection.x == 0 && moveDirection.y == 0 :
			$AnimatedSprite2D.play("Idle")
		else:
			$AnimatedSprite2D.play("Walk")
	
	# flipper la sprite si on se déplace vers la droite
	if moveDirection.x > 0: 
		$AnimatedSprite2D.flip_h = false	
	if moveDirection.x < 0:
		$AnimatedSprite2D.flip_h = true


func _physics_process(delta):
	handleInput()
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("Idle")
	punch = false
	
	if $AnimatedSprite2D.flip_h == false :
		for body in $RightFist.get_overlapping_bodies():
			# jouer un son
			if(body.get_collision_layer() == 2):
				body.hurt()
					
	if $AnimatedSprite2D.flip_h == true :
		for body in $LeftFist.get_overlapping_bodies():
			# jouer un son
			if(body.get_collision_layer() == 2):
				body.hurt()
				
				
func bell_sound() :
	$BellSound.play()
