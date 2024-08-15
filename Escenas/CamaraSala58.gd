extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 58:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_s_446tp_3_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 58
	Guardado.save_game()


func _on_s_46tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 58
	Guardado.save_game()


func _on_s_60tp_4_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 58
	Guardado.save_game()


func _on_s_62tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 58
	Guardado.save_game()


func _on_s_58tp_4_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_58tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_58tp_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false
