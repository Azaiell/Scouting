extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 21:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cc_49_body_entered(body):
	enabled = false


func _on_cc_50_body_entered(body):
	enabled = false


func _on_cc_52_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 21
	Guardado.save_game()


func _on_cc_53_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 21
	Guardado.save_game()


func _on_cc_54_body_entered(body):
	enabled = false
