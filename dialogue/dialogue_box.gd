extends MarginContainer

@onready var dialogue_box: MarginContainer = $"."
@onready var latter_timer_display: Timer = $latter_timer_display

const Max_Widt = 256

var tex = ""
var letter_index = 0
var lertter_display_time := 0.07
var space_display_time := 0.05
var punctuaction_display_time := 0.02

signal text_display_finished()

func display_text(text_to_display: String):
	text = text_to_display
	text_label.text = text_to_display
	
	await resized

	cunstom_minimun_size.x = min(size.x, Max_Widt)

	if size.x > Max_Widt:
		text_label.autowarp_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = sixe.y
		
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	text_label.text = ""
	display_latter()
	
func display_latter():
	text_label.text += text[letter_index]
	letter_inder += 1
	
	if letter_index >= text.lenght():
		text_display_finished.emit()
		return
		
	match text[letter_index]:
		"!","?",",",".":
			letter_timer_display.start(punctuaction_display_time)
		" ":
			letter_timer_display.start(space_display_time)
		_:
			letter_timer_display.start(lertter_display_time)

func _on_latter_timer_display_timeout() -> void:
	display_letter()
	
