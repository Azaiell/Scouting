extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 14:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cc_32_body_entered(body):
	enabled = false


func _on_cc_34_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 14
	Guardado.save_game()


func _on_cc_35_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 14
	Guardado.save_game()


func _on_cc_36_body_entered(body):
	enabled = false


func _on_cc_37_body_entered(body):
	enabled = false
