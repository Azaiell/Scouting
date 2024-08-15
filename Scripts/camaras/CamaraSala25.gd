extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 25:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_2_cc_1_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_2_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_3_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_4_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_5_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_6_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_7_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_8_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 25
	Guardado.save_game()


func _on_bio_2_cc_9_body_entered(body):
	enabled = false


func _on_bio_2_cc_17_body_entered(body):
	enabled = false


func _on_bio_2_cc_21_body_entered(body):
	enabled = false


func _on_bio_2_cc_27_body_entered(body):
	enabled = false


func _on_cambiotp_s_24_body_entered(body):
	enabled = false
