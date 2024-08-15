extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 42:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_2_cc_54_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 42
	Guardado.save_game()


func _on_bio_2_cc_53_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 42
	Guardado.save_game()


func _on_bio_2_cc_52_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 42
	Guardado.save_game()


func _on_bio_2_cc_51_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 42
	Guardado.save_game()


func _on_bio_2_cc_49_body_entered(body):
	enabled = false


func _on_bio_2_cc_44_body_entered(body):
	enabled = false


func _on_bio_2_cc_39_body_entered(body):
	enabled = false


func _on_bio_2_cc_34_body_entered(body):
	enabled = false


func _on_cambiotp_s_43_body_entered(body):
	enabled = true
