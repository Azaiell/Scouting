extends Node

var save_path = "user://save_game.dat"

var game_data : Dictionary = {
	"position" : Vector2.ZERO,
	"camara" : 1,
	"conversation_check" : 0,
	"layer_azucena_check1" : false,
	"layer_azucena_check2" : false,
	"layer_azucena_check3" : false,
	"layer_azucena_check4" : false,
	"layer_azucena_check5" : false,
	"layer_azucena_check6" : false,
	"layer_azucena_check7" : false,
	"layer_azucena_check8" : false,
	"layer_azucena_check9" : false,
	"layer_azucena_check10" : false,
	"layer_azucena_check11" : false,
	"layer_azucena_check12" : false,
	"mask_azucena_check1" : false,
	"mask_azucena_check2" : false,
	"mask_azucena_check3" : false,
	"mask_azucena_check4" : false,
	"mask_azucena_check5" : false,
	"mask_azucena_check6" : false,
	"mask_azucena_check7" : false,
	"mask_azucena_check8" : false,
	"mask_azucena_check9" : false,
	"mask_azucena_check10" : false,
	"mask_azucena_check11" : false,
	"mask_azucena_check12" : false,
	"Gald_position" : Vector2.ZERO,
	"Darek_position" : Vector2.ZERO,
	"Lirio_position" : Vector2.ZERO,
	"posiciondelacamaraBIO5" : Vector2.ZERO
}

func save_game() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	
	save_file.store_var(game_data)
	save_file.close()
	#print(game_data)
	
func load_game() -> void:
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)
		
		game_data = save_file.get_var()
		save_file.close()
		
			
func new_game() -> void:
	if FileAccess.file_exists(save_path):
		var dir = DirAccess.open("user://")
		if dir:
			var error_code = dir.remove("save_game.dat")
			if error_code == OK:
				print("Datos de guardado eliminados exitosamente")
			else:
				print("Error al eliminar el archivo de guardado")
		else:
			print("No se pudo abrir el directorio")
	else:
		print("No se encontraron datos de guardado")
