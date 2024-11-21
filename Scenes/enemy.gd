extends CharacterBody2D

func hurt() : 
	$AudioStreamPlayer2D.play()

func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
