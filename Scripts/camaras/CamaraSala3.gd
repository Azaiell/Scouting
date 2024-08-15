extends Camera2D


signal oculta
signal muestra
signal ven
# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 3:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Camara"):
		enabled = false
		
	if enabled:
		emit_signal("muestra")
		
	if !enabled:
		emit_signal("oculta")
	#if Input.is_action_just_pressed("Camara"):
	#	enabled = true
	pass
	
func _on_cc_2_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 3
	Guardado.save_game()

func _on_cc_3_body_entered(body):
	enabled = false

func _on_cc_4_body_entered(body):
	enabled = false

func _on_cc_5_body_entered(body):
	enabled = false

func _on_cc_7_body_entered(body):
	enabled = false

func _on_cc_6_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 3
	Guardado.save_game()

func _on_s_11cambiotp_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 3
	Guardado.save_game()
