extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 5:
			enabled = true
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if Input.is_action_just_pressed("Camara"):
	#	enabled = true
	
	if enabled:
		get_node("/root/Global").where = 5


func _on_cc_8_body_entered(body):
	enabled = false


func _on_cc_9_body_entered(body):
	enabled = false


func _on_cc_10_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 5
	Guardado.save_game()


func _on_cc_11_body_entered(body):
	enabled = false


func _on_cc_12_body_entered(body):
	enabled = false


func _on_cc_13_body_entered(body):
	enabled = true
	Guardado.game_data["camara"] = 5
	Guardado.save_game()
