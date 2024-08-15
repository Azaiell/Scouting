extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 11:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("Camara"):
	#	enabled = true
	pass


func _on_cc_15_body_entered(body):
	enabled = false


func _on_cc_26_body_entered(body):
	enabled = false


func _on_cc_27_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 11
	Guardado.save_game()


func _on_cc_28_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 11
	Guardado.save_game()


func _on_s_11cambiotp_body_entered(body):
	enabled = false


func _on_s_12_cambiotp_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 11
	Guardado.save_game()
