extends StaticBody2D

# Variáveis de movimento e estado do NPC
const speed = 30

var dir = Vector2.RIGHT
var current_state = IDLE
var is_roaming = true
var is_chatting = false
var player
var player_in_chat_zone = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

@onready var dialogue_box = $Dialogue  # Ajuste o caminho para o seu nó de diálogo

# Processa o estado de interação
func _process(delta):
	if player_in_chat_zone and Input.is_action_just_pressed("ui_accept"):  # Usar "ui_accept" em vez de "chat"
		start_dialogue()  # Inicia o diálogo quando pressionar a tecla
		is_chatting = true
		$animation.play("idle")  # Toca animação de espera do NPC

func start_dialogue():
	dialogue_box.show_dialogue()  # Assume que você tem uma função `show_dialogue` no script de diálogo
	is_roaming = false  # NPC para de andar durante o diálogo

# Detecta quando o player entra e sai da área de chat
func _on_chat_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true

func _on_chat_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false
		if not is_chatting:
			is_roaming = true  # Retorna ao movimento do NPC quando o player sai

func _on_dialogue_dialogue_finished():
	is_chatting = false
	is_roaming = true  # NPC volta a se mover após o fim do diálogo
