extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 6:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("Camara"):
	#	enabled = true
	pass


func _on_cc_14_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 6
	Guardado.save_game()


func _on_cc_15_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 6
	Guardado.save_game()


func _on_cc_16_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 6
	Guardado.save_game()


func _on_s_6cambiotp_body_entered(body):
	enabled = false


func _on_cc_17_body_entered(body):
	enabled = false


func _on_cc_28_body_entered(body):
	enabled = false


func _on_s_16_cambiotp_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 6
	Guardado.save_game()
