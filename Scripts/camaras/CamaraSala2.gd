extends Camera2D


signal oculta
signal muestra
signal ven
# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 2:
			enabled = true
			print("he cargado la cámara2")
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
	
	if enabled:
		get_node("/root/Global").where = 2

func _on_character_body_2d_cambio():
	enabled = false # Replace with function body.

func _on_cc_2_body_entered(body):
	enabled = false

func _on_cc_3_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 2
	Guardado.save_game()

func _on_cc_4_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 2
	Guardado.save_game()


func _on_cc_11_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 2
	Guardado.save_game()


func _on_cc_12_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 2
	Guardado.save_game()


func _on_cc_13_body_entered(body):
	enabled = false


func _on_s_6cambiotp_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 2
	Guardado.save_game()


func _on_s_9a_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	enabled = true
	Guardado.game_data["camara"] = 2
	Guardado.save_game()


func _on_volver_pressed():
#	Guardado.game_data["camara"] = 2
#	Guardado.save_game()
	pass


