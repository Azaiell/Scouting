extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 65:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_4_cc_1_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 65
	Guardado.save_game()


func _on_bio_4_cc_2_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 65
	Guardado.save_game()


func _on_bio_4_cc_3_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 65
	Guardado.save_game()


func _on_bio_4_cc_4_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 65
	Guardado.save_game()


func _on_bio_4_cc_6_body_entered(body):
	enabled = false


func _on_bio_4_cc_7_body_entered(body):
	enabled = false


func _on_bio_4_cc_9_body_entered(body):
	enabled = false


func _on_bio_4_cc_11_body_entered(body):
	enabled = false


func _on_switch_s_65_body_entered(body):
	enabled = false


func _on_switch_s_85_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 65
	Guardado.save_game()
