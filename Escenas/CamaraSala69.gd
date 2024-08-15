extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 69:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_4_cc_14_body_entered(body):
	enabled = false


func _on_bio_4_cc_15_body_entered(body):
	enabled = false


func _on_bio_4_cc_16_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 69
	Guardado.save_game()


func _on_bio_4_cc_17_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 69
	Guardado.save_game()


func _on_bio_4_cc_18_body_entered(body):
	enabled = false
