extends Control



func _on_exitBtn_pressed():
	get_tree().quit()
 


func _on_playBtn_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://scenes/world.tscn")
