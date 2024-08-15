extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 38:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_2_cc_43_body_entered(body):
	enabled = false


func _on_bio_2_cc_42_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 38
	Guardado.save_game()


func _on_bio_2_cc_41_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 38
	Guardado.save_game()


func _on_bio_2_cc_40_body_entered(body):
	enabled = false
