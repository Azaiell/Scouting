extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 35:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_2_cc_54_body_entered(body):
	enabled = false


func _on_bio_2_cc_36_body_entered(body):
	enabled = false


func _on_bio_2_cc_35_body_entered(body):
	enabled = true


func _on_bio_2_cc_34_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 35
	Guardado.save_game()


func _on_bio_2_cc_33_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 35
	Guardado.save_game()


func _on_bio_2_cc_32_body_entered(body):
	enabled = false
