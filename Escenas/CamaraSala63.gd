extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 63:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_49tp_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 63
	Guardado.save_game()


func _on_s_56tp_6_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 63
	Guardado.save_game()


func _on_s_60tp_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 63
	Guardado.save_game()


func _on_s_63tp_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_63tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_63tp_3_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_63tp_4_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_63tp_5_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_47tp_5_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 63
	Guardado.save_game()


func _on_s_48tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 63
	Guardado.save_game()


func _on_s_53tp_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 63
	Guardado.save_game()


func _on_s_63tp_6_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false