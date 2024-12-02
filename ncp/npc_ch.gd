extends Node2D

@onready var label: Label = $Label

var player_in_area: bool = false





func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interação"):
		label.text = "Bem vindo ao Campus SPP"


func _on_area_2d_body_entered(body):
	if body.name == "player":
		player_in_area = true
		label.visible = true
		label.text = "Pressione 'E' para interagir."
		


func _on_area_2d_body_exited(body):
	if body.name == "player":
		player_in_area = false
	label.visible = false
