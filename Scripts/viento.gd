extends Node2D

var viento = 2
var on = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_zona_de_viento_body_entered(body):
	on = true
	if on:
		body.physics_material_override.bounce = 0
	if on:
		await get_tree().create_timer(2).timeout
		if on:
			await get_tree().create_timer(0.20).timeout
			body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento))
			if on:
				await get_tree().create_timer(0.20).timeout
				body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento))
				if on:
					await get_tree().create_timer(0.20).timeout
					body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento))
					if on:
						await get_tree().create_timer(0.10).timeout
						body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento * 4))
						if on:
							await get_tree().create_timer(0.10).timeout
							body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento * 4))
							if on:
								await get_tree().create_timer(0.10).timeout
								body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento * 10))
								if on:
									await get_tree().create_timer(0.10).timeout
									body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento * 20))
									if on:
										await get_tree().create_timer(0.30).timeout
										body.apply_central_impulse(Vector2($"Zona de viento/Freno".target_position * viento * 20))
										await get_tree().create_timer(3).timeout
										if on:
											body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento))
											await get_tree().create_timer(0.20).timeout
											if on:
												body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento))
												await get_tree().create_timer(0.20).timeout
												if on:
													body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento))
													await get_tree().create_timer(0.20).timeout
													if on:
														body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento * 4))
														await get_tree().create_timer(0.10).timeout
														if on:
															body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento * 4))
															await get_tree().create_timer(0.10).timeout
															if on:
																body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento * 10))
																await get_tree().create_timer(0.10).timeout
																if on:
																	body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento * 20))
																	await get_tree().create_timer(0.10).timeout
																	if on:
																		body.apply_central_impulse(Vector2($"Zona de viento/Direccion".target_position * viento * 20))
																		body.physics_material_override.bounce = 0.5




func _on_zona_de_viento_body_exited(body):
	on = false
	body.physics_material_override.bounce = 0.5
