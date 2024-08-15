extends Area2D



signal subir
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_character_body_2d_investigo():
	emit_signal("camara")


func _on_camara_sala_1_muestra():
	show()


func _on_camara_sala_1_oculta():
	hide()
