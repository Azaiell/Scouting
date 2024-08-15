extends RigidBody2D


signal pauso
signal nopauso
signal cae1
signal cae2
signal again
signal cambio1
signal cambio2
signal investigo
signal apaga
signal apaga3
signal apaga4
signal apaga5
signal apaga6
signal apaga7
signal apaga8
signal apaga9
signal apaga10
signal apaga11
signal apaga11_2
signal apaga12
signal apaga12_2
signal apaga13
signal apaga14
signal apaga15
signal apaga16
signal apaga17

var save_timer = 3.0
var time_since_last_save = 0.0
var Segundos : float  #variable para acumular impulso
var Estado = true     #variable para gravedad hacia abajo
var Estado2 = false   #variable para gravedad hacia la izquierda
var Estado3 = false   #variable para gravedad hacia arriba
var Estado4 = false   #variable para gravedad hacia la derecha
var Subestado1 = false #variable para caer por la sección sur
var Subestado2 = false #variable para caer por la sección norte
var Caida = false      #variable para caerse
var Nada = true #variable para que no pase nada, para esperar transiciones
var Agarrado1 = false  #variable para controlar la G en la parte sur
var Agarrado2 = false  #variable para controlar G en la parte norte
var Investigar = false #variable para el estado de botón I
var gravedad = 100     #variable para la gravedad
var velocity = Vector2() #variable para reiniciar la gravedad
var salto = false

func _ready():           #que la rotación empiece así
	rotation = 0
	physics_material_override.bounce = 0.5
	linear_damp = 8
	if FileAccess.file_exists(Guardado.save_path):
		Guardado.load_game()
		global_position = Guardado.game_data["position"]
		set_collision_mask_value(1, Guardado.game_data["mask_azucena_check1"])
		set_collision_mask_value(2, Guardado.game_data["mask_azucena_check2"])
		set_collision_mask_value(3, Guardado.game_data["mask_azucena_check3"])
		set_collision_mask_value(4, Guardado.game_data["mask_azucena_check4"])
		set_collision_mask_value(5, Guardado.game_data["mask_azucena_check5"])
		set_collision_mask_value(6, Guardado.game_data["mask_azucena_check6"])
		set_collision_mask_value(7, Guardado.game_data["mask_azucena_check7"])
		set_collision_mask_value(8, Guardado.game_data["mask_azucena_check8"])
		set_collision_mask_value(9, Guardado.game_data["mask_azucena_check9"])
		set_collision_mask_value(10, Guardado.game_data["mask_azucena_check10"])
		set_collision_mask_value(11, Guardado.game_data["mask_azucena_check11"])
		set_collision_mask_value(12, Guardado.game_data["mask_azucena_check12"])
		set_collision_layer_value(1, Guardado.game_data["layer_azucena_check1"])
		set_collision_layer_value(2, Guardado.game_data["layer_azucena_check2"])
		set_collision_layer_value(3, Guardado.game_data["layer_azucena_check3"])
		set_collision_layer_value(4, Guardado.game_data["layer_azucena_check4"])
		set_collision_layer_value(5, Guardado.game_data["layer_azucena_check5"])
		set_collision_layer_value(6, Guardado.game_data["layer_azucena_check6"])
		set_collision_layer_value(7, Guardado.game_data["layer_azucena_check7"])
		set_collision_layer_value(8, Guardado.game_data["layer_azucena_check8"])
		set_collision_layer_value(9, Guardado.game_data["layer_azucena_check9"])
		set_collision_layer_value(10, Guardado.game_data["layer_azucena_check10"])
		set_collision_layer_value(11, Guardado.game_data["layer_azucena_check11"])
		set_collision_layer_value(12, Guardado.game_data["layer_azucena_check12"])
	else:
		global_position = Vector2(960, 350)
		set_collision_mask_value(1, true)
		set_collision_mask_value(2, false)
		set_collision_mask_value(3, false)
		set_collision_mask_value(4, false)
		set_collision_mask_value(5, false)
		set_collision_mask_value(6, false)
		set_collision_mask_value(7, false)
		set_collision_mask_value(8, false)
		set_collision_mask_value(9, false)
		set_collision_mask_value(10, false)
		set_collision_mask_value(11, false)
		set_collision_mask_value(12, false)
		set_collision_layer_value(1, true)
		set_collision_layer_value(2, false)
		set_collision_layer_value(3, false)
		set_collision_layer_value(4, false)
		set_collision_layer_value(5, false)
		set_collision_layer_value(6, false)
		set_collision_layer_value(7, false)
		set_collision_layer_value(8, false)
		set_collision_layer_value(9, false)
		set_collision_layer_value(10, false)
		set_collision_layer_value(11, false)
		set_collision_layer_value(12, false)
func _process(delta):
	time_since_last_save += delta
	if time_since_last_save >= save_timer:
		Guardado.game_data["layer_azucena_check1"] = get_collision_layer_value(1)
		Guardado.game_data["layer_azucena_check2"] = get_collision_layer_value(2)
		Guardado.game_data["layer_azucena_check3"] = get_collision_layer_value(3)
		Guardado.game_data["layer_azucena_check4"] = get_collision_layer_value(4)
		Guardado.game_data["layer_azucena_check5"] = get_collision_layer_value(5)
		Guardado.game_data["layer_azucena_check6"] = get_collision_layer_value(6)
		Guardado.game_data["layer_azucena_check7"] = get_collision_layer_value(7)
		Guardado.game_data["layer_azucena_check8"] = get_collision_layer_value(8)
		Guardado.game_data["layer_azucena_check9"] = get_collision_layer_value(9)
		Guardado.game_data["layer_azucena_check10"] = get_collision_layer_value(10)
		Guardado.game_data["layer_azucena_check11"] = get_collision_layer_value(11)
		Guardado.game_data["layer_azucena_check12"] = get_collision_layer_value(12)
		Guardado.game_data["mask_azucena_check1"] = get_collision_mask_value(1)
		Guardado.game_data["mask_azucena_check2"] = get_collision_mask_value(2)
		Guardado.game_data["mask_azucena_check3"] = get_collision_mask_value(3)
		Guardado.game_data["mask_azucena_check4"] = get_collision_mask_value(4)
		Guardado.game_data["mask_azucena_check5"] = get_collision_mask_value(5)
		Guardado.game_data["mask_azucena_check6"] = get_collision_mask_value(6)
		Guardado.game_data["mask_azucena_check7"] = get_collision_mask_value(7)
		Guardado.game_data["mask_azucena_check8"] = get_collision_mask_value(8)
		Guardado.game_data["mask_azucena_check9"] = get_collision_mask_value(9)
		Guardado.game_data["mask_azucena_check10"] = get_collision_mask_value(10)
		Guardado.game_data["mask_azucena_check11"] = get_collision_mask_value(11)
		Guardado.game_data["mask_azucena_check12"] = get_collision_mask_value(12)
		Guardado.game_data["position"] = global_position
		Guardado.save_game()
		print("He guardado")
		time_since_last_save = 0.0
	
	
func _physics_process(delta):
	rotation = 0            #que nunca rote
	
	if Estado:
		if Nada:
			Segundos = 0           #reinicia el impulso
			velocity.y = 0         #reinicia la gravedad
			
			
			if $Ojo.get_collider():          #funcionamiento de I cuando hay que saltar 1 sala
				if $Ojo.get_collider().is_in_group("Escalera1"):
					if Input.is_action_just_released("Inv"):
						emit_signal("nopauso")
						Nada = false
						await get_tree().create_timer(1).timeout
						position.y = position.y - 1080
						Nada = true
						emit_signal("pauso")
			else:
				pass
				
			if $Ojo.get_collider():          #funcionamiento de I cuando hay que saltar 3 salas
				if $Ojo.get_collider().is_in_group("Escalera2"):
					if Input.is_action_just_released("Inv"):
						emit_signal("nopauso")
						Nada = false
						await get_tree().create_timer(1).timeout
						position.y = position.y - 3240
						Nada = true
						emit_signal("pauso")
			else:
				pass
				
			if $Ojo.get_collider():          #funcionamiento de I cuando hay que saltar 3 salas
				if $Ojo.get_collider().is_in_group("Escalera3"):
					if Input.is_action_just_released("Inv"):
						emit_signal("nopauso")
						Nada = false
						await get_tree().create_timer(1).timeout
						position.y = position.y - 4320
						Nada = true
						emit_signal("pauso")
			else:
				pass
				
			if $Ojo.get_collider():          #funcionamiento de I cuando hay que saltar 3 salas
				if $Ojo.get_collider().is_in_group("Escalera4"):
					if Input.is_action_just_released("Inv"):
						emit_signal("nopauso")
						Nada = false
						await get_tree().create_timer(1).timeout
						position.y = position.y - 2160
						Nada = true
						emit_signal("pauso")
			else:
				pass
				
			if $Ojo.get_collider():          #funcionamiento de I cuando hay que saltar 3 salas
				if $Ojo.get_collider().is_in_group("Escalera5"):
					if Input.is_action_just_released("Inv"):
						emit_signal("nopauso")
						Nada = false
						await get_tree().create_timer(1).timeout
						position.x = position.x + 24905
						Nada = true
						emit_signal("pauso")
			else:
				pass
				
			#código del movimiento
			if Input.is_action_pressed("Left") && !Input.is_action_pressed("Down") && !Input.is_action_pressed("Up"):
				await get_tree().create_timer(0.129).timeout
				while Input.is_action_pressed("Left") && Segundos <= 1750:
					await get_tree().create_timer(0.22).timeout
					Segundos = Segundos + 4 * (1/delta)
					if Input.is_action_just_released("Left") && !Input.is_action_pressed("Down") && !Input.is_action_pressed("Up"):
						await !Input
						apply_central_impulse(Vector2(Segundos, 0))
			if Input.is_action_pressed("Right") && !Input.is_action_pressed("Down") && !Input.is_action_pressed("Up"):
				await get_tree().create_timer(0.129).timeout
				while Input.is_action_pressed("Right") && Segundos <= 1750:
					await get_tree().create_timer(0.22).timeout
					Segundos = Segundos + 4 * (1/delta)
					if Input.is_action_just_released("Right") && !Input.is_action_pressed("Down") && !Input.is_action_pressed("Up"):
						await !Input
						apply_central_impulse(Vector2(-Segundos, 0))
			if Input.is_action_pressed("Down") && !Input.is_action_pressed("Right") && !Input.is_action_pressed("Left"):
				await get_tree().create_timer(0.10).timeout
				while Input.is_action_pressed("Down") && Segundos <= 1250:
					await get_tree().create_timer(0.17).timeout
					Segundos = Segundos + 4 * (1/delta)
					if Input.is_action_just_released("Down") && !Input.is_action_pressed("Right") && !Input.is_action_pressed("Left"):
						await !Input
						apply_central_impulse(Vector2(0, -Segundos))
			if Input.is_action_pressed("Up") && !Input.is_action_pressed("Right") && !Input.is_action_pressed("Left"):
				await get_tree().create_timer(0.10).timeout
				while Input.is_action_pressed("Up") && Segundos <= 1250:
					await get_tree().create_timer(0.17).timeout
					Segundos = Segundos + 4 * (1/delta)
					if Input.is_action_just_released("Up") && !Input.is_action_pressed("Right") && !Input.is_action_pressed("Left"):
						await !Input
						apply_central_impulse(Vector2(0, Segundos))
					#código de la G
					
			if salto:
				if $Pie1.get_collider() or $Pie2.get_collider():
					if Input.is_action_just_released("Right"):
						apply_central_impulse(Vector2(0, -Segundos))
					if Input.is_action_just_released("Left"):
						apply_central_impulse(Vector2(0, -Segundos))
				if $Mano1.get_collider():
					if $Mano1.get_collider().is_in_group("Agarrables"):
						if Input.is_action_just_released("Left"):
							apply_central_impulse(Vector2(0, -Segundos))
				if $Mano2.get_collider():
					if $Mano2.get_collider().is_in_group("Agarrables"):
						if Input.is_action_just_released("Right"):
							apply_central_impulse(Vector2(0, -Segundos))
			
			
			if Input.is_action_pressed("Grab"):
				if $RayCastDown.get_collider():
					if $RayCastDown.get_collider().is_in_group("Agarrables"):
						physics_material_override.bounce = 0
						await get_tree().create_timer(1).timeout
						physics_material_override.bounce = 0.5
				if $RayCastUp.get_collider():
					if $RayCastUp.get_collider().is_in_group("Agarrables"):
						physics_material_override.bounce = 0
						await get_tree().create_timer(1).timeout
						physics_material_override.bounce = 0.5
				if $RayCastLeft.get_collider():
					if $RayCastLeft.get_collider().is_in_group("Agarrables"):
						physics_material_override.bounce = 0
						await get_tree().create_timer(1).timeout
						physics_material_override.bounce = 0.5
				if $RayCastRight.get_collider():
					if $RayCastRight.get_collider().is_in_group("Agarrables"):
						physics_material_override.bounce = 0
						await get_tree().create_timer(1).timeout
						physics_material_override.bounce = 0.5
		
		if Agarrado1: 
			if Input.is_action_just_released("Grab"):
				Agarrado1 = false
				await get_tree().create_timer(1).timeout
				if !Agarrado1:
					emit_signal ("again")
			
		
	if !Estado:    #código de la gravedad sur
		await get_tree().create_timer(0.5).timeout
		if !Estado && Subestado1:
			Caida = true
			apply_central_impulse(Vector2(0, gravedad))
			set_collision_layer_value(2, true)
			set_collision_layer_value(1, false)
			set_collision_mask_value(2, true)
			set_collision_mask_value(1, false)
			set_collision_layer_value(3, true)
			set_collision_mask_value(3, true)
		else:
			pass
	
	if !Estado:    #código de la gravedad norte
		await get_tree().create_timer(0.5).timeout
		if !Estado && Subestado2:
			Caida = true
			apply_central_impulse(Vector2(0, gravedad))
			set_collision_layer_value(4, true)
			set_collision_layer_value(1, false)
			set_collision_mask_value(4, true)
			set_collision_mask_value(1, false)
			set_collision_layer_value(5, true)
			set_collision_mask_value(5, true)
		else:
			pass
			
	if Estado2:   #código de la gravedad izquierda
		await get_tree().create_timer(0.5).timeout
		if Estado2:
			Caida = true
			apply_central_impulse(Vector2(gravedad, gravedad / 3))
			set_collision_layer_value(2, true)
			set_collision_layer_value(1, false)
			set_collision_mask_value(2, true)
			set_collision_mask_value(1, false)
			set_collision_layer_value(4, true)
			set_collision_mask_value(4, true)
			set_collision_layer_value(6, true)
			set_collision_mask_value(6, true)
		else:
			pass
			
	if Estado3:    #código de la gravedad hacia arriba
		await get_tree().create_timer(0.5).timeout
		if Estado3:
			Caida = true
			apply_central_impulse(Vector2(0, -gravedad))
			set_collision_layer_value(2, true)
			set_collision_layer_value(1, false)
			set_collision_mask_value(2, true)
			set_collision_mask_value(1, false)
			set_collision_layer_value(3, true)
			set_collision_mask_value(3, true)
		else:
			pass
		
	if Estado4:    #código de la gravedad hacia la derecha
		await get_tree().create_timer(0.5).timeout
		if Estado4:
			Caida = true
			apply_central_impulse(Vector2(-gravedad, gravedad / 3))
			set_collision_layer_value(2, true)
			set_collision_layer_value(1, false)
			set_collision_mask_value(2, true)
			set_collision_mask_value(1, false)
			set_collision_layer_value(3, true)
			set_collision_mask_value(3, true)
		else:
			pass
#--------------------------------------------------------------------
func _on_sala_2_abismo_1_body_entered(body):     #caiga
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_sub_z_3_1_body_entered(body):   #parar la caida
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)

func _on_sala_2_abismo_1_body_exited(body):   #que no se caiga cuando pasas sobre un abismo
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_sala_2_abismo_1_caete():   #que se caiga cuando sueltas la G
	Estado = false
	Subestado1 = true
	
func _on_sala_2_abismo_2_body_entered(body):   #caida
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_sala_2_abismo_2_body_exited(body):    #que no se caiga cuando pasas un abismo
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_sub_z_1_body_entered(body):       #que frene la caida en la parte norte
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)

func _on_sala_2_abismo_2_caete():    #que se caiga cuando sueltas la G en la parte norte(comprobar si funciona)
	Estado = false
	Subestado2 = true
#------------------------------------------------------------------------------
func _on_s_3a_1_body_entered(body):  #caida sala 3 derecha
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true
		
func _on_s_3a_1_body_exited(body): #no te caigas sala 3 derecha
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_frenada_1_body_entered(body):  #para de caerte sala 2
	#await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_3a_2_body_entered(body): #caida sala 3 izquierda
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado3 = true

func _on_s_3a_2_body_exited(body): #no te caigas sala 3 izquierda
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado3 = false
		Caida = false
		Nada = true

func _on_s_4_f_1_body_entered(body): #para de caerte sala 4
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado3 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_5a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)

func _on_s_5a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(6, false)
		set_collision_mask_value(6, false)

func _on_s_5a_2_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_5a_2_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_4_f_2_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado4 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_5a_1_caete():
	Estado4 = true

func _on_sala_2_abismo_c_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true

func _on_sala_2_abismo_c_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Subestado1 = false
		Caida = false

func _on_sala_2_abismo_c_2_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true

func _on_sala_2_abismo_c_2_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_5a_1c_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado4 = true
			Nada = false
			set_collision_layer_value(6, true)
			set_collision_mask_value(6, true)

func _on_s_5a_1c_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true

func _on_s_6a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_6a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_6a_2_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_6a_2_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_6cambiotp_body_entered(body):  #TP1  (en sala 6)
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2100

func _on_s_2fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga")

func _on_s_2fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga")

func _on_s_6ac_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true

func _on_s_6ac_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_6ac_2_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado2 = true

func _on_s_6ac_2_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_7a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true

func _on_s_7a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true

func _on_s_7ac_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado4 = true
			Nada = false

func _on_s_7ac_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true

func _on_s_7f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado4 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_9a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true

func _on_s_9a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_9f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_9a_2_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado3 = true

func _on_s_9a_2_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado3 = false
		Caida = false
		Nada = true

func _on_s_9a_3_body_entered(body):
	await get_tree().create_timer(1).timeout
	position.y = position.y + 2940
	Estado3 = false
	Caida = false
	Nada = true
	emit_signal("pauso")
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_10a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true

func _on_s_10a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_10ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado2 = true
			Nada = false

func _on_s_10ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_10f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_11a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_11a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_11ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true

func _on_s_11ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_11a_2_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_11a_2_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_11cambiotp_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2100

func _on_s_3fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga3")

func _on_s_3fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga3")

func _on_s_12au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_12au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_12aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_12aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_12_cambiotp_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2100

func _on_s_11fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga4")

func _on_s_11fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga4")

func _on_s_13au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_13au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_13aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_13aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_13ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true

func _on_s_13ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_13f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado = true
	Subestado1 = false
	Subestado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_13f_2_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado = true
	Subestado1 = false
	Subestado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_14au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_14au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_14aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_14aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_14f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado = true
	Subestado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)

func _on_s_16aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_16aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_16au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_16au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_16ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado2 = true

func _on_s_16ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_16_cambiotp_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2100

func _on_s_6fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga5")

func _on_s_6fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga5")

func _on_s_17aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.5).timeout
	Estado = false
	Subestado1 = true

func _on_s_17aa_body_exited(body):
	await get_tree().create_timer(0.5).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_17_cambiotp_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2100

func _on_s_7fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga6")

func _on_s_18a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_18f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_19au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_19au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_19aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_19aa_body_exited(body):
	await get_tree().create_timer(0.5).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_19ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado2 = true

func _on_s_19ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_19ad_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true

func _on_s_19ad_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_19adc_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado2 = true
			Nada = false
			set_collision_layer_value(6, true)
			set_collision_mask_value(6, true)

func _on_s_19adc_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_cambiotp_s_19_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2100

func _on_s_9fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga7")

func _on_s_9fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga7")

func _on_s_19f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_20ad_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true

func _on_s_20ad_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true

func _on_s_20ai_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado3 = true

func _on_s_20ai_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado3 = false
		Caida = false
		Nada = true

func _on_s_20f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado3 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_21a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true

func _on_s_21a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_21ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado2 = true
			Nada = false

func _on_s_21ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_21f_1_body_entered(body):
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_22au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_22au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_22aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_22aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_cambiotp_s_22_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2100

func _on_s_10fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga8")

func _on_s_10fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga8")

func _on_s_23au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_23au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_23aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_23aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_cambiotp_s_23_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 3100

func _on_s_22fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga9")

func _on_s_22fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga9")

#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------

func _on_s_24au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_s_24au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_s_24aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_24aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_23fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga10")

func _on_s_23fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga10")

func _on_cambio_layer_bio_2_body_entered(body):
	set_collision_layer_value(7, true)
	set_collision_layer_value(8, true)
	set_collision_mask_value(7, true)
	set_collision_mask_value(8, true)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)

func _on_s_33_ah_u_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado3 = true

func _on_s_33_ah_u_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado3 = false
		Caida = false
		Nada = true

func _on_s_33_ah_d_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true

func _on_s_33_ah_d_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_33f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_33f_2_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado3 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_32a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true

func _on_s_32a_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_32ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado2 = true
			Nada = false

func _on_s_32ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_32f_body_entered(body):
	await get_tree().create_timer(0.75).timeout
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_31_ah_d_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true

func _on_s_31_ah_d_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true

func _on_s_31_ah_a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_31_ah_a_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_31ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true

func _on_s_31ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_31f_2_body_entered(body):
	await get_tree().create_timer(0.75).timeout
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_31f_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)

func _on_s_30a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_30a_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_30f_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)

func _on_s_29_ah_a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_s_29_ah_a_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_s_29_ah_i_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)

func _on_s_29_ah_i_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(6, false)
		set_collision_mask_value(6, false)

func _on_s_29ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado4 = true
			Nada = false
			set_collision_layer_value(6, true)
			set_collision_mask_value(6, true)

func _on_s_29ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(6, false)
		set_collision_mask_value(6, false)

func _on_s_29f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado4 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_29f_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)

func _on_s_28a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)

func _on_s_28a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(6, false)
		set_collision_mask_value(6, false)

func _on_s_28f_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado4 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_27_ah_u_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado3 = true

func _on_s_27_ah_u_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado3 = false
		Caida = false
		Nada = true

func _on_s_27_ah_i_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)

func _on_s_27_ah_i_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(6, false)
		set_collision_mask_value(6, false)

func _on_s_27f_1_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado3 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_27f_2_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado4 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)

func _on_s_26a_1_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado3 = true

func _on_s_26a_1_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado3 = false
		Caida = false
		Nada = true

func _on_s_26ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado3 = true
			Nada = false

func _on_s_26ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado3 = false
		Caida = false
		Nada = true

func _on_s_26f_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	emit_signal("pauso")
	Estado3 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_25au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)

func _on_s_25au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(6, false)
		set_collision_mask_value(6, false)

func _on_s_25aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)

func _on_s_25aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(6, false)
		set_collision_mask_value(6, false)

func _on_cambiotp_s_24_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 1000

func _on_s_24fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga10")

func _on_s_24fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	emit_signal("apaga10")

func _on_s_34au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_34au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_34aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_34aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_41auc_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado2 = true
			set_collision_layer_value(8, false)
			set_collision_mask_value(8, false)

func _on_s_41auc_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_41aac_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_41aac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_40au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_40au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_40aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_40aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_35au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_35au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_35aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_35aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_36au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_36au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_36aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_36aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_37au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_37au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_37aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_37aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_38au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_38au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_38aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_38aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_39au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_39au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_39aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_39aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_42au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_42au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_42aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_42aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_43au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_43au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_43aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_43aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_cambiotp_s_34_41_40_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2000

func _on_s_332627sf_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	emit_signal("apaga11")
	await get_tree().create_timer(0.5).timeout
	emit_signal("apaga11_2")

func _on_s_332627sf_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	emit_signal("apaga11")
	await get_tree().create_timer(0.5).timeout
	emit_signal("apaga11_2")

func _on_cambiotp_s_35_42_39_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2000
	
func _on_s_32_25_28_fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	emit_signal("apaga12")
	await get_tree().create_timer(0.5).timeout
	emit_signal("apaga12_2")

func _on_s_32_25_28_fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	emit_signal("apaga12")
	await get_tree().create_timer(0.5).timeout
	emit_signal("apaga12_2")

func _on_cambiotp_s_36_37_38_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 2000

func _on_s_313029fs_1_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	emit_signal("apaga13")

func _on_s_313029fs_2_body_entered(body):
	await get_tree().create_timer(0.5).timeout
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(3, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	emit_signal("apaga13")

func _on_cambiotp_s_43_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	position.y = position.y + 1000

func _on_s_42fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga14")

func _on_s_42fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga14")

func _on_s_43cl_body_entered(body):
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)

#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------

func _on_s_44au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_44au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_44aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_44aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_44ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado2 = true
			set_collision_layer_value(7, false)
			set_collision_mask_value(7, false)

func _on_s_44ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_45au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_45au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_45aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_45aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_46ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true
			set_collision_layer_value(7, false)
			set_collision_mask_value(7, false)

func _on_s_46ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_46au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_46au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_46aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_46aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_47au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_47au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_47aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_47aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_47ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true
			set_collision_layer_value(7, false)
			set_collision_mask_value(7, false)

func _on_s_47ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_48au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_48au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_48aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_48aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_48ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true
			set_collision_layer_value(7, false)
			set_collision_mask_value(7, false)

func _on_s_48ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_50au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_50au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_50aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_50aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_50ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado2 = true
			Nada = false
			set_collision_layer_value(7, false)
		set_collision_mask_value(7, false)

func _on_s_50ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_52au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_52au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_52aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_52aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_52ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true
			set_collision_layer_value(7, false)
			set_collision_mask_value(7, false)

func _on_s_52ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_53au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_53au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_53aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_53aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_55au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_55au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_55aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_55aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_56au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_56au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_56aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_56aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_56ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true
			set_collision_layer_value(7, false)
			set_collision_mask_value(7, false)

func _on_s_56ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_58au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_58au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_58aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_58aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_59au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_59au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_59aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_59aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_61au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_61au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_61aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_61aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_62au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_62au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_62aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_62aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_63au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_63au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_63aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_63aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_64au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_64au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_64aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_64aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_54au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_54au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_54aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_54aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_s_56z_body_entered(body):
	emit_signal("nopauso")
	Nada = false

func _on_s_56z_body_exited(body):
	emit_signal("pauso")
	Nada = true

func _on_s_62z_body_entered(body):
	emit_signal("nopauso")
	Nada = false

func _on_s_62z_body_exited(body):
	emit_signal("pauso")
	Nada = true

func _on_s_63z_body_entered(body):
	emit_signal("nopauso")
	Nada = false

func _on_s_63z_body_exited(body):
	emit_signal("pauso")
	Nada = true

func _on_s_47z_body_entered(body):
	emit_signal("nopauso")
	Nada = false

func _on_s_47z_body_exited(body):
	emit_signal("pauso")
	Nada = true

func _on_s_53z_body_entered(body):
	emit_signal("nopauso")
	Nada = false

func _on_s_53z_body_exited(body):
	emit_signal("pauso")
	Nada = true

func _on_s_54z_body_entered(body):
	emit_signal("nopauso")
	Nada = false

func _on_s_54z_body_exited(body):
	emit_signal("pauso")
	Nada = true

func _on_tp__switch_43_body_entered(body):
	await get_tree().create_timer(0.15).timeout
	position.y = position.y + 900
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_50f_body_entered(body):
	emit_signal("pauso")
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)

func _on_s_55f_body_entered(body):
	emit_signal("pauso")
	await get_tree().create_timer(0.1).timeout
	Estado4 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)

func _on_s_43fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_tp_s_50_body_entered(body):
	position.x = position.x + 1945
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_tp_s_55_body_entered(body):
	position.x = position.x - 1940
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_tp__switch_s_45_body_entered(body):
	await get_tree().create_timer(0.15).timeout
	position.y = position.y + 900
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_60fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_s_60fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_tp__switch_s_46_body_entered(body):
	await get_tree().create_timer(0.15).timeout
	position.y = position.y + 900
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_51fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_s_51fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_tp__switch_s_47_body_entered(body):
	await get_tree().create_timer(0.15).timeout
	position.y = position.y + 900
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_57fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_s_57fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_tp__switch_s_48_body_entered(body):
	await get_tree().create_timer(0.15).timeout
	position.y = position.y + 900
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_58fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_s_58fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_tp__switch_s_64_body_entered(body):
	await get_tree().create_timer(0.15).timeout
	position.y = position.y + 900
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)

func _on_s_49fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_s_49fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")

func _on_s_43fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	emit_signal("apaga15")
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
func _on_zona_salto_body_entered(body):
	salto = true

func _on_zona_salto_body_exited(body):
	salto = false

func _on_s_65_cl_body_entered(body):
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	set_collision_layer_value(10, true)
	set_collision_mask_value(10, true)

func _on_bio_4_ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado1 = true
			set_collision_layer_value(7, false)
			set_collision_mask_value(7, false)

func _on_bio_4_ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(7, true)
		set_collision_mask_value(7, true)

func _on_n_body_entered(body):
	Nada = false

func _on_n_body_exited(body):
	Nada = false

func _on_bio_4_au_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_bio_4_au_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_bio_4_aa_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_bio_4_aa_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_66a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado2 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_66a_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_67a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado4 = true
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)

func _on_s_67a_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado4 = false
		Caida = false
		Nada = true
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_66ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Estado2 = true
			Nada = false
			set_collision_layer_value(8, false)
			set_collision_mask_value(8, false)

func _on_s_66ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Estado2 = false
		Caida = false
		Nada = true
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_bio_4_acs_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			Estado = false
			Subestado2 = true
			set_collision_layer_value(8, false)
			set_collision_mask_value(8, false)

func _on_bio_4_acs_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false
		set_collision_layer_value(8, true)
		set_collision_mask_value(8, true)

func _on_s_64fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga16")

func _on_s_64fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	emit_signal("apaga16")

func _on_s_66f_body_entered(body):
	emit_signal("pauso")
	await get_tree().create_timer(0.5).timeout
	Estado2 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)

func _on_s_67f_body_entered(body):
	emit_signal("pauso")
	await get_tree().create_timer(0.5).timeout
	Estado4 = false
	Caida = false
	Nada = true
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)

func _on_s_68f_body_entered(body):
	emit_signal("pauso")
	await get_tree().create_timer(0.5).timeout
	Estado = true
	Subestado1 = false
	Caida = false
	Nada = true
	set_collision_layer_value(1, true)
	set_collision_mask_value(1, true)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)

func _on_s_68__s_75_switch_body_entered(body):
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	set_collision_layer_value(2, true)
	set_collision_mask_value(2, true)
	await get_tree().create_timer(2).timeout
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(1, true)

func _on_switch_s_85_body_entered(body):
	await get_tree().create_timer(0.15).timeout
	position.y = position.y + 4000

func _on_s_65fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(4, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)
	emit_signal("apaga16")

func _on_s_65fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	emit_signal("apaga16")

func _on_switch_s_65_body_entered(body):
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)
	set_collision_layer_value(10, false)
	set_collision_mask_value(10, false)

#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------

func _on_acam_u_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_acam_a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_apos_u_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado2 = true

func _on_apos_a_body_entered(body):
	emit_signal("nopauso")
	Nada = false
	await get_tree().create_timer(0.25).timeout
	Estado = false
	Subestado1 = true

func _on_apos_u_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado2 = false

func _on_apos_a_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Estado = true
		Caida = false
		Subestado1 = false

func _on_bio_5_ac_body_entered(body):
	await get_tree().create_timer(0.25).timeout
	if $RayCastDown.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastDown.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastUp.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastUp.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastLeft.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastLeft.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	if $RayCastRight.get_collider() && Input.is_action_pressed("Grab"):
		if $RayCastRight.get_collider().is_in_group("Agarrables"):
			Agarrado1 = true
	else:
		if !Agarrado1:
			emit_signal("nopauso")
			Nada = false
			emit_signal("cae1")

func _on_bio_5_ac_body_exited(body):
	await get_tree().create_timer(0.25).timeout
	if Caida:
		pass
	else:
		emit_signal("pauso")
		Nada = true
		Caida = false
		emit_signal("cae2")

func _on_cambio_tp_bio_5_body_entered(body):
	position.x = position.x - 24960
	position.y = position.y + 1915

func _on_cambio_tp_bio_5_i_body_entered(body):
	position.x = -1825
	position.y = -39050

func _on_cambio_tp_bio_5_d_body_entered(body):
	position.x = -100
	position.y = -39050

func _on_s_86fs_1_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado2 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)
	set_collision_layer_value(10, false)
	set_collision_mask_value(10, false)
	set_collision_layer_value(11, false)
	set_collision_mask_value(11, false)
	emit_signal("apaga16")

func _on_s_86fs_2_body_entered(body):
	emit_signal("pauso")
	Nada = true
	Estado = true
	Caida = false
	Subestado1 = false
	set_collision_layer_value(2, false)
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, false)
	set_collision_mask_value(1, true)
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)
	set_collision_layer_value(10, false)
	set_collision_mask_value(10, false)
	set_collision_layer_value(11, false)
	set_collision_mask_value(11, false)
	emit_signal("apaga16")

func _on_cl_bio_5_body_entered(body):
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	set_collision_layer_value(10, true)
	set_collision_mask_value(10, true)
	set_collision_layer_value(11, true)
	set_collision_mask_value(11, true)
	set_collision_layer_value(12, true)
	set_collision_mask_value(12, true)

func _on_volver_pressed():
	Guardado.game_data["layer_azucena_check1"] = get_collision_layer_value(1)
	Guardado.game_data["layer_azucena_check2"] = get_collision_layer_value(2)
	Guardado.game_data["layer_azucena_check3"] = get_collision_layer_value(3)
	Guardado.game_data["layer_azucena_check4"] = get_collision_layer_value(4)
	Guardado.game_data["layer_azucena_check5"] = get_collision_layer_value(5)
	Guardado.game_data["layer_azucena_check6"] = get_collision_layer_value(6)
	Guardado.game_data["layer_azucena_check7"] = get_collision_layer_value(7)
	Guardado.game_data["layer_azucena_check8"] = get_collision_layer_value(8)
	Guardado.game_data["layer_azucena_check9"] = get_collision_layer_value(9)
	Guardado.game_data["layer_azucena_check10"] = get_collision_layer_value(10)
	Guardado.game_data["layer_azucena_check11"] = get_collision_layer_value(11)
	Guardado.game_data["layer_azucena_check12"] = get_collision_layer_value(12)
	Guardado.game_data["mask_azucena_check1"] = get_collision_mask_value(1)
	Guardado.game_data["mask_azucena_check2"] = get_collision_mask_value(2)
	Guardado.game_data["mask_azucena_check3"] = get_collision_mask_value(3)
	Guardado.game_data["mask_azucena_check4"] = get_collision_mask_value(4)
	Guardado.game_data["mask_azucena_check5"] = get_collision_mask_value(5)
	Guardado.game_data["mask_azucena_check6"] = get_collision_mask_value(6)
	Guardado.game_data["mask_azucena_check7"] = get_collision_mask_value(7)
	Guardado.game_data["mask_azucena_check8"] = get_collision_mask_value(8)
	Guardado.game_data["mask_azucena_check9"] = get_collision_mask_value(9)
	Guardado.game_data["mask_azucena_check10"] = get_collision_mask_value(10)
	Guardado.game_data["mask_azucena_check11"] = get_collision_mask_value(11)
	Guardado.game_data["mask_azucena_check12"] = get_collision_mask_value(12)
	Guardado.game_data["position"] = global_position
	Guardado.save_game()
