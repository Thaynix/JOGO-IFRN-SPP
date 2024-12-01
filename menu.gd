extends Control
class_name Menu

func _ready() -> void:
	for _button in get_tree().get_nodes_in_group("Button"):
		_button.pressed.connect(_on_button_pressed.bind(_button))
		
func _on_button_pressed(_button: Button) -> void:
	match _button.name:
		"Play":
			get_tree().change_scene_to_file("res://Scene/world.tscn")
			
		"Quit":
			get_tree().quit()


func _on_play_pressed():
	pass # Replace with function body.
