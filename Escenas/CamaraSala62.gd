extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 62:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_45tp_5_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 62
	Guardado.save_game()


func _on_s_52tp_4_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 62
	Guardado.save_game()


func _on_s_62tp_6_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_62tp_5_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_62tp_4_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_62tp_3_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_62tp_2_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_62tp_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = false


func _on_s_58tp_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 62
	Guardado.save_game()


func _on_s_54tp_7_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 62
	Guardado.save_game()


func _on_s_53tp_4_body_entered(body):
	await get_tree().create_timer(1).timeout
	enabled = true
	Guardado.game_data["camara"] = 62
	Guardado.save_game()
