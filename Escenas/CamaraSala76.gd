extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 76:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_4_cc_28_body_entered(body):
	enabled = false


func _on_bio_4_cc_29_body_entered(body):
	enabled = false


func _on_bio_4_cc_30_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 76
	Guardado.save_game()


func _on_bio_4_cc_31_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 76
	Guardado.save_game()


func _on_bio_4_cc_32_body_entered(body):
	enabled = false
