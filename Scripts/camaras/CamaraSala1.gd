extends Camera2D

signal oculta
signal muestra
# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		if Guardado.game_data["camara"] == 1:
			enabled = true
			print("cargo la camara1")
		else:
			enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if Input.is_action_just_pressed("Camara"):
		enabled = false
		
	if enabled:
		emit_signal("muestra")
		
	if !enabled:
		emit_signal("oculta")
	pass



func _on_volver_pressed():
	pass


