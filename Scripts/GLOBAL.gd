extends Node

signal guardec2
signal cont
signal investigar2
var Investigar2 = false
var where = 1
var on = false
var guarde = 1
var nopausa = false
var inter_faz = true

func _ready():
	Engine.max_fps = 60

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pausa"):
		if nopausa:
			pass
		else:
			if has_node("CanvasLayer/Menu Pausa/Control"):
				get_tree().paused = true
				$"CanvasLayer/Menu Pausa/Control".show()
				$CanvasLayer/Interfaz.show()
				
	if Input.is_action_just_pressed("Interfaz"):
			if has_node("CanvasLayer/Interfaz"):
				if inter_faz:
					$CanvasLayer/Interfaz.show()
					inter_faz = false
				else:
					$CanvasLayer/Interfaz.hide()
					inter_faz = true
		
func _physics_process(delta):
#	if guarde == 2:
#		emit_signal("guardec2")
	
	if Input.is_action_just_pressed("Camara"):
		on = true
	
	if Investigar2:
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala1/CamaraSala1").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala1/CamaraSala1.enabled = false
				$Mundo/Sala2/CamaraSala2.enabled = true
				Guardado.game_data["camara"] = 2
				Guardado.save_game()
				print("guardo la cámara2")
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala2/CamaraSala2").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala6/CameraSala6.enabled = true
				$Mundo/Sala2/CamaraSala2.enabled = false
				Guardado.game_data["camara"] = 6
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala11/CamaraSala11").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala11/CamaraSala11.enabled = false
				$Mundo/Sala12/CamaraSala12.enabled = true
				Guardado.game_data["camara"] = 12
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala22/CamaraSala22").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala22/CamaraSala22.enabled = false
				$Mundo/Sala23/CamaraSala23.enabled = true
				Guardado.game_data["camara"] = 23
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala23/CamaraSala23").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala22/CamaraSala23.enabled = false
				$Mundo/Sala24/CamaraSala24.enabled = true
				Guardado.game_data["camara"] = 24
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala24/CamaraSala24").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala24/CamaraSala24.enabled = false
				$Mundo/Sala25/CamaraSala25.enabled = true
				Guardado.game_data["camara"] = 25
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala33/CamaraSala33").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala33/CamaraSala33.enabled = false
				$Mundo/Sala34/CamaraSala34.enabled = true
				Guardado.game_data["camara"] = 34
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala27/CamaraSala27").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala27/CamaraSala27.enabled = false
				$Mundo/Sala40/CamaraSala40.enabled = true
				Guardado.game_data["camara"] = 40
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala29/CamaraSala29").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala29/CamaraSala29.enabled = false
				$Mundo/Sala38/CamaraSala38.enabled = true
				Guardado.game_data["camara"] = 38
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala31/CamaraSala31").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala31/CamaraSala31.enabled = false
				$Mundo/Sala36/CamaraSala36.enabled = true
				Guardado.game_data["camara"] = 36
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala42/CamaraSala42").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala42/CamaraSala42.enabled = false
				$Mundo/Sala43/CamaraSala43.enabled = true
				Guardado.game_data["camara"] = 43
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala64/CamaraSala64").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala64/CamaraSala64.enabled = false
				$Mundo/Sala65/CamaraSala65.enabled = true
				Guardado.game_data["camara"] = 65
				Guardado.save_game()
			else:
				pass
		if Input.is_action_just_pressed("Inv"):
			if get_node("Mundo/Sala85/CamaraSala85").enabled:
				await get_tree().create_timer(1).timeout
				$Mundo/Sala85/CamaraSala85.enabled = false
				$"Mundo/BIO 5/CamaraBIO 5".enabled = true
				Guardado.game_data["camara"] = 86
				Guardado.save_game()
			else:
				pass
func _on_escalera_1_body_entered(body):
	Investigar2 = true


func _on_escalera_1_body_exited(body):
	Investigar2 = false


func _on_cambioabajo_body_entered(body):
	$Mundo/Sala1/CamaraSala1.enabled = true
	$Mundo/Sala2/CamaraSala2.enabled = false
	Guardado.game_data["camara"] = 1
	Guardado.save_game()
	print("guardo la cámara1")


func _on_escalera_2_body_entered(body):
	Investigar2 = true


func _on_escalera_2_body_exited(body):
	Investigar2 = false


func _on_escalera_3_body_entered(body):
	Investigar2 = true


func _on_escalera_3_body_exited(body):
	Investigar2 = false



func _on_escalera_4_body_entered(body):
	Investigar2 = true


func _on_escalera_4_body_exited(body):
	Investigar2 = false


func _on_escalera_5_body_entered(body):
	Investigar2 = true


func _on_escalera_5_body_exited(body):
	Investigar2 = false


func _on_escalera_6_body_entered(body):
	Investigar2 = true


func _on_escalera_6_body_exited(body):
	Investigar2 = false


func _on_escalera_7_body_entered(body):
	Investigar2 = true


func _on_escalera_7_body_exited(body):
	Investigar2 = false


func _on_escalera_8_body_entered(body):
	Investigar2 = true


func _on_escalera_8_body_exited(body):
	Investigar2 = false


func _on_escalera_9_body_entered(body):
	Investigar2 = true


func _on_escalera_9_body_exited(body):
	Investigar2 = false


func _on_escalera_10_body_entered(body):
	Investigar2 = true


func _on_escalera_10_body_exited(body):
	Investigar2 = false


func _on_escalera_11_body_entered(body):
	Investigar2 = true


func _on_escalera_11_body_exited(body):
	Investigar2 = false


func _on_cambiotp_s_34_41_40_body_entered(body):
	if get_node("Mundo/Sala34/CamaraSala34").enabled:
		$Mundo/Sala34/CamaraSala34.enabled = false
		$Mundo/Sala33/CamaraSala33.enabled = true
		Guardado.game_data["camara"] = 33
		Guardado.save_game()
	if get_node("Mundo/Sala40/CamaraSala40").enabled:
		$Mundo/Sala40/CamaraSala40.enabled = false
		$Mundo/Sala37/CamaraSala37.enabled = true
		Guardado.game_data["camara"] = 37
		Guardado.save_game()
	if get_node("Mundo/Sala41/CamaraSala41").enabled:
		$Mundo/Sala41/CamaraSala41.enabled = false
		$Mundo/Sala26/CamaraSala26.enabled = true
		Guardado.game_data["camara"] = 26
		Guardado.save_game()


func _on_cambiotp_s_35_42_39_body_entered(body):
	if get_node("Mundo/Sala35/CamaraSala35").enabled:
		$Mundo/Sala35/CamaraSala35.enabled = false
		$Mundo/Sala32/CamaraSala32.enabled = true
		Guardado.game_data["camara"] = 32
		Guardado.save_game()
	if get_node("Mundo/Sala42/CamaraSala42").enabled:
		$Mundo/Sala42/CamaraSala42.enabled = false
		$Mundo/Sala25/CamaraSala25.enabled = true
		Guardado.game_data["camara"] = 25
		Guardado.save_game()
	if get_node("Mundo/Sala39/CamaraSala39").enabled:
		$Mundo/Sala39/CamaraSala39.enabled = false
		$Mundo/Sala28/CamaraSala28.enabled = true
		Guardado.game_data["camara"] = 28
		Guardado.save_game()


func _on_cambiotp_s_36_37_38_body_entered(body):
	if get_node("Mundo/Sala36/CamaraSala36").enabled:
		$Mundo/Sala36/CamaraSala36.enabled = false
		$Mundo/Sala31/CamaraSala31.enabled = true
		Guardado.game_data["camara"] = 31
		Guardado.save_game()
	if get_node("Mundo/Sala37/CamaraSala37").enabled:
		$Mundo/Sala37/CamaraSala37.enabled = false
		$Mundo/Sala30/CamaraSala30.enabled = true
		Guardado.game_data["camara"] = 30
		Guardado.save_game()
	if get_node("Mundo/Sala38/CamaraSala38").enabled:
		$Mundo/Sala38/CamaraSala38.enabled = false
		$Mundo/Sala29/CamaraSala29.enabled = true
		Guardado.game_data["camara"] = 29
		Guardado.save_game()



func _on_s_43tp_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1700
	get_node("Azucena").position.y = -20650


func _on_s_44tp_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1850
	get_node("Azucena").position.y = -18825


func _on_s_43tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5700
	get_node("Azucena").position.y = -21150


func _on_s_43tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -2825
	get_node("Azucena").position.y = -21075
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 250))


func _on_s_50tp_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -962
	get_node("Azucena").position.y = -18425


func _on_s_44tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1345
	get_node("Azucena").position.y = -21265


func _on_s_44tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -875
	get_node("Azucena").position.y = -20700


func _on_s_44tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2300
	get_node("Azucena").position.y = -20615
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(300, 0))


func _on_s_44tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5540
	get_node("Azucena").position.y = -24950


func _on_s_50tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -150
	get_node("Azucena").position.y = -23270


func _on_s_50tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5650
	get_node("Azucena").position.y = -25650


func _on_s_50tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -850
	get_node("Azucena").position.y = -23140


func _on_s_50tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1550
	get_node("Azucena").position.y = -24935


func _on_s_55tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2410
	get_node("Azucena").position.y = -21175


func _on_s_55tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -350
	get_node("Azucena").position.y = -21150


func _on_s_55tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2600
	get_node("Azucena").position.y = -20615
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(-300, 0))


func _on_s_55tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2900
	get_node("Azucena").position.y = -23540


func _on_s_45tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5160
	get_node("Azucena").position.y = -20960
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 300))


func _on_s_45tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4500
	get_node("Azucena").position.y = -20735


func _on_s_45tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1050
	get_node("Azucena").position.y = -23135
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(-300, 0))


func _on_s_45tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -850
	get_node("Azucena").position.y = -23330
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(300, 0))


func _on_s_45tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7585
	get_node("Azucena").position.y = -24935


func _on_s_51tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -85
	get_node("Azucena").position.y = -25700


func _on_s_57tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6615
	get_node("Azucena").position.y = -20580


func _on_s_49tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7585
	get_node("Azucena").position.y = -27095


func _on_s_64tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2875
	get_node("Azucena").position.y = -30005


func _on_s_52tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -350
	get_node("Azucena").position.y = -21150


func _on_s_52tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5180
	get_node("Azucena").position.y = -21135


func _on_s_52tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5680
	get_node("Azucena").position.y = -29235


func _on_s_52tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6725
	get_node("Azucena").position.y = -25675


func _on_s_52tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1735
	get_node("Azucena").position.y = -27125


func _on_s_52tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1410
	get_node("Azucena").position.y = -29990


func _on_s_46tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4215
	get_node("Azucena").position.y = -21260


func _on_s_46tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3705
	get_node("Azucena").position.y = -27870
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 300))


func _on_s_446tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3750
	get_node("Azucena").position.y = -27285


func _on_s_46tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4325
	get_node("Azucena").position.y = -23485


func _on_s_46tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2025
	get_node("Azucena").position.y = -22785


func _on_s_46tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3395
	get_node("Azucena").position.y = -30030
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 300))


func _on_s_56tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -670
	get_node("Azucena").position.y = -25400


func _on_s_56tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -185
	get_node("Azucena").position.y = -27870
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 300))


func _on_s_56tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7100
	get_node("Azucena").position.y = -23550
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 300))


func _on_s_56tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3500
	get_node("Azucena").position.y = -21285


func _on_s_56tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 5850
	get_node("Azucena").position.y = -22750


func _on_s_56tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 5835
	get_node("Azucena").position.y = -27865


func _on_s_60tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 5835
	get_node("Azucena").position.y = -27865


func _on_s_60tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7585
	get_node("Azucena").position.y = -21220


func _on_s_60tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2000
	get_node("Azucena").position.y = -25350


func _on_s_60tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2870
	get_node("Azucena").position.y = -27875


func _on_s_60tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6400
	get_node("Azucena").position.y = -20650


func _on_s_61tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 5820
	get_node("Azucena").position.y = -23110


func _on_s_61tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6850
	get_node("Azucena").position.y = -23000


func _on_s_61tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3750
	get_node("Azucena").position.y = -23500


func _on_s_61tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5455
	get_node("Azucena").position.y = -29250
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(300, 0))


func _on_s_61tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -3925
	get_node("Azucena").position.y = -29980


func _on_s_62tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1845
	get_node("Azucena").position.y = -27085


func _on_s_62tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2010
	get_node("Azucena").position.y = -27875


func _on_s_62tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4400
	get_node("Azucena").position.y = -25325


func _on_s_62tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4965
	get_node("Azucena").position.y = -27845


func _on_s_62tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1050
	get_node("Azucena").position.y = -23330


func _on_s_62tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2365
	get_node("Azucena").position.y = -30040
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 300))


func _on_s_63tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3750
	get_node("Azucena").position.y = -23050


func _on_s_63tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 5825
	get_node("Azucena").position.y = -21035


func _on_s_63tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5695
	get_node("Azucena").position.y = -27475


func _on_s_63tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1585
	get_node("Azucena").position.y = -29645


func _on_s_63tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1310
	get_node("Azucena").position.y = -27070


func _on_s_63tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6200
	get_node("Azucena").position.y = -29250


func _on_s_58tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 5825
	get_node("Azucena").position.y = -25680


func _on_s_58tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7135
	get_node("Azucena").position.y = -21400


func _on_s_58tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2900
	get_node("Azucena").position.y = -27075


func _on_s_58tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1065
	get_node("Azucena").position.y = -25650


func _on_s_58tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3620
	get_node("Azucena").position.y = -27285


func _on_s_59tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 3725
	get_node("Azucena").position.y = -29740


func _on_s_59tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2015
	get_node("Azucena").position.y = -29740


func _on_s_59tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1000
	get_node("Azucena").position.y = -31440


func _on_s_59tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -80
	get_node("Azucena").position.y = -29245


func _on_s_47tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4115
	get_node("Azucena").position.y = -25525


func _on_s_47tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1840
	get_node("Azucena").position.y = -29405


func _on_s_47tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1500
	get_node("Azucena").position.y = -27125


func _on_s_47tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7600
	get_node("Azucena").position.y = -27510


func _on_s_47tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -1120
	get_node("Azucena").position.y = -27520


func _on_s_47tp_7_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7475
	get_node("Azucena").position.y = -23425


func _on_s_54tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -3900
	get_node("Azucena").position.y = -25050


func _on_s_54tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6150
	get_node("Azucena").position.y = -23375


func _on_s_54tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4725
	get_node("Azucena").position.y = -29625
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(-300, 0))


func _on_s_54tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -3905
	get_node("Azucena").position.y = -27455


func _on_s_54tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4900
	get_node("Azucena").position.y = -29800
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(300, 0))


func _on_s_54tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2870
	get_node("Azucena").position.y = -29580
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(0, 300))


func _on_s_54tp_7_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 5825
	get_node("Azucena").position.y = -24925


func _on_s_48tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4150
	get_node("Azucena").position.y = -25175


func _on_s_48tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6970
	get_node("Azucena").position.y = -27485


func _on_s_48tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -330
	get_node("Azucena").position.y = -27530


func _on_s_48tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -525
	get_node("Azucena").position.y = -29725


func _on_s_48tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -750
	get_node("Azucena").position.y = -30005


func _on_s_48tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 2870
	get_node("Azucena").position.y = -29230


func _on_s_53tp_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 6325
	get_node("Azucena").position.y = -27685


func _on_s_53tp_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5100
	get_node("Azucena").position.y = -27345
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(-300, 0))


func _on_s_53tp_3_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -5100
	get_node("Azucena").position.y = -27615
	await get_tree().create_timer(1.5).timeout
	body.apply_central_impulse(Vector2(-300, 0))


func _on_s_53tp_4_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = 7600
	get_node("Azucena").position.y = -25670


func _on_s_53tp_5_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4080
	get_node("Azucena").position.y = -27720


func _on_s_53tp_6_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4905
	get_node("Azucena").position.y = -27275


func _on_s_53tp_7_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	get_node("Azucena").position.x = -4805
	get_node("Azucena").position.y = -29650


func _on_tp__switch_s_45_body_entered(body):
	if get_node("Mundo/Sala45/CamaraSala45").enabled:
		$Mundo/Sala45/CamaraSala45.enabled = false
		$Mundo/Sala44/CamaraSala44.enabled = true
		Guardado.game_data["camara"] = 44
		Guardado.save_game()
	if get_node("Mundo/Sala56/CamaraSala56").enabled:
		$Mundo/Sala56/CamaraSala56.enabled = false
		$Mundo/Sala55/CamaraSala55.enabled = true
		Guardado.game_data["camara"] = 55
		Guardado.save_game()
	if get_node("Mundo/Sala61/CamaraSala61").enabled:
		$Mundo/Sala61/CamaraSala61.enabled = false
		$Mundo/Sala60/CamaraSala60.enabled = true
		Guardado.game_data["camara"] = 60
		Guardado.save_game()


func _on_tp__switch_s_46_body_entered(body):
	if get_node("Mundo/Sala52/CamaraSala52").enabled:
		$Mundo/Sala52/CamaraSala52.enabled = false
		$Mundo/Sala51/CamaraSala51.enabled = true
		Guardado.game_data["camara"] = 51
		Guardado.save_game()
	if get_node("Mundo/Sala46/CamaraSala46").enabled:
		$Mundo/Sala46/CamaraSala46.enabled = false
		$Mundo/Sala45/CamaraSala45.enabled = true
		Guardado.game_data["camara"] = 45
		Guardado.save_game()
	if get_node("Mundo/Sala62/CamaraSala62").enabled:
		$Mundo/Sala62/CamaraSala62.enabled = false
		$Mundo/Sala61/CamaraSala61.enabled = true
		Guardado.game_data["camara"] = 61
		Guardado.save_game()


func _on_tp__switch_s_47_body_entered(body):
	if get_node("Mundo/Sala53/CamaraSala53").enabled:
		$Mundo/Sala53/CamaraSala53.enabled = false
		$Mundo/Sala52/CamaraSala52.enabled = true
		Guardado.game_data["camara"] = 52
		Guardado.save_game()
	if get_node("Mundo/Sala47/CamaraSala47").enabled:
		$Mundo/Sala47/CamaraSala47.enabled = false
		$Mundo/Sala46/CamaraSala46.enabled = true
		Guardado.game_data["camara"] = 46
		Guardado.save_game()
	if get_node("Mundo/Sala58/CamaraSala58").enabled:
		$Mundo/Sala58/CamaraSala58.enabled = false
		$Mundo/Sala57/CamaraSala57.enabled = true
		Guardado.game_data["camara"] = 57
		Guardado.save_game()
	if get_node("Mundo/Sala63/CamaraSala63").enabled:
		$Mundo/Sala63/CamaraSala63.enabled = false
		$Mundo/Sala62/CamaraSala62.enabled = true
		Guardado.game_data["camara"] = 62
		Guardado.save_game()


func _on_tp__switch_s_48_body_entered(body):
	if get_node("Mundo/Sala54/CamaraSala54").enabled:
		$Mundo/Sala54/CamaraSala54.enabled = false
		$Mundo/Sala53/CamaraSala53.enabled = true
		Guardado.game_data["camara"] = 53
		Guardado.save_game()
	if get_node("Mundo/Sala48/CamaraSala48").enabled:
		$Mundo/Sala48/CamaraSala48.enabled = false
		$Mundo/Sala47/CamaraSala47.enabled = true
		Guardado.game_data["camara"] = 47
		Guardado.save_game()
	if get_node("Mundo/Sala59/CamaraSala59").enabled:
		$Mundo/Sala59/CamaraSala59.enabled = false
		$Mundo/Sala58/CamaraSala58.enabled = true
		Guardado.game_data["camara"] = 58
		Guardado.save_game()


func _on_escalera_12_body_entered(body):
	Investigar2 = true


func _on_escalera_12_body_exited(body):
	Investigar2 = false


func _on_escalera_13_body_entered(body):
	Investigar2 = true


func _on_escalera_13_body_exited(body):
	Investigar2 = false

func _on_volver_pressed():
	Cortina.change_scene_to_file("res://Escenas/menú_principal.tscn")
	get_tree().paused = false


func _on_continuar_2_pressed():
	get_tree().paused = false
	$"CanvasLayer/Menu Pausa/Control".hide()
	$CanvasLayer/Interfaz.hide()


func _on_azucena_pauso():
	nopausa = false

func _on_azucena_nopauso():
	nopausa = true

func _on_n_body_entered(body):
	nopausa = true

func _on_n_body_exited(body):
	nopausa = false
