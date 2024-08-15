extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 22:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cc_46_body_entered(body):
	enabled = false


func _on_cc_53_body_entered(body):
	enabled = false


func _on_cc_54_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 22
	Guardado.save_game()


func _on_cc_55_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 22
	Guardado.save_game()


func _on_cambiotp_s_22_body_entered(body):
	enabled = false


func _on_cambiotp_s_23_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 22
	Guardado.save_game()
