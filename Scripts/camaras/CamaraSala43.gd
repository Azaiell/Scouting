extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 43:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("Camara"):
	#	enabled = true
	pass


func _on_cambiotp_s_43_body_entered(body):
	enabled = false


func _on_s_43tp_1_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_43tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false
	


func _on_s_43tp_3_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_44tp_1_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 43
	Guardado.save_game()


func _on_s_50tp_1_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 43
	Guardado.save_game()


func _on_tp__switch_43_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 43
	Guardado.save_game()
