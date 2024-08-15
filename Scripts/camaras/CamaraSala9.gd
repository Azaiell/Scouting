extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 9:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("Camara"):
	#	enabled = true
	pass

func _on_cc_20_body_entered(body):
	enabled = false


func _on_cc_21_body_entered(body):
	enabled = false


func _on_s_9a_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	enabled = false


func _on_cc_24_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 9
	Guardado.save_game()


func _on_cc_23_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 9
	Guardado.save_game()


func _on_cc_22_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 9
	Guardado.save_game()


func _on_cc_25_body_entered(body):
	enabled = false


func _on_cambiotp_s_19_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 9
	Guardado.save_game()
