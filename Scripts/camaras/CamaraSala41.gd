extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 41:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_2_cc_51_body_entered(body):
	enabled = false


func _on_bio_2_cc_50_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 41
	Guardado.save_game()


func _on_bio_2_cc_49_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 41
	Guardado.save_game()


func _on_bio_2_cc_48_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 41
	Guardado.save_game()


func _on_bio_2_cc_47_body_entered(body):
	enabled = false


func _on_bio_2_cc_31_body_entered(body):
	enabled = false
