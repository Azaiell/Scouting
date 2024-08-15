extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 61:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_56tp_5_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 61
	Guardado.save_game()


func _on_s_56tp_3_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 61
	Guardado.save_game()


func _on_s_61tp_6_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_61tp_4_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_61tp_3_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_47tp_7_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 61
	Guardado.save_game()


func _on_s_54tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 61
	Guardado.save_game()
