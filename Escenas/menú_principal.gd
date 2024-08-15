extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_salir_pressed():
	get_tree().quit()


func _on_nuevo_juego_pressed():
	if FileAccess.file_exists(Guardado.save_path):
		$Confirmar.show()


func _on_continuar_pressed():
	Cortina.change_scene_to_file("res://Escenas/Raíz.tscn")
	


func _on_si_pressed():
	Guardado.new_game()
	Cortina.change_scene_to_file("res://Escenas/Raíz.tscn")


func _on_no_pressed():
	$Confirmar.hide()
