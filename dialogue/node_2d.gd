extends Node2D

@onready var area_sign: Area2D = $Area_sign
const lines : Array[String] = {
	"Campus SPP, muito massa",
}
func _unhandled_input(event):
	if event.is_action_pressed("interact") && Dialogue_box.is_message_action:
		texture.hide()
		Dialogue_box.start_messager(global_position, lines)
	else:
		texture.hide()
