extends Camera2D

signal oculta
signal muestra
signal ven
# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 7:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Camara"):
		enabled = false
		
	if enabled:
		emit_signal("muestra")
		emit_signal("ven")
		
	if !enabled:
		emit_signal("oculta")
	pass


func _on_cc_14_body_entered(body):
	enabled = false


func _on_cc_16_body_entered(body):
	enabled = false


func _on_cc_17_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 7
	Guardado.save_game()


func _on_cc_18_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 7
	Guardado.save_game()


func _on_cc_19_body_entered(body):
	enabled = false


func _on_s_17_cambiotp_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 7
	Guardado.save_game()
