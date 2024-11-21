extends Control

func _on_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/empty_scene.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_movement.tscn")

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_audio.tscn")
	
func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_attack.tscn")	
