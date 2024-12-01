extends Node

@onready var dialog_box_scene = preload("res://dialogue/dialogue_box.gd")
var message_line : Array[String] = {}
var current_line = 0

var dialog_box 
var dialog_box_posisition = Vector2.ZERO

var is_messager_active := false
var can_advence_message := false

func start_message(position: Vector2, lines: Array[String]):
	if is_messager_active:
		return
	message_line = lines
	dialog_box_posisition = position
	show_text()
	is_messager_active = true
	
func show_text():
	dialog_box = dialog_box_scene.instantiate()
	dialog_box.text_display_finished.connect(_on_all_text_displayed)
	get_tree().root.add_child(dialog_box)
	dialog_box.global_position = dialog_box_posisition
	dialog_box.display_text(message_line[current_line])
	can_advence_message = false
	
func _on_all_text_displayed():
	can_advence_message = true

func _unhandled_input(event):
	if(event.is_action_pressed("advence_message") && is_messager_active && can_advence_message):
			dialog_box.queue_free()
			current_line = 1
			if current_line >= message_line.size():
				current_line = 0
				return
			show_text()
