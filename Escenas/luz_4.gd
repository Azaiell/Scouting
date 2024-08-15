extends Node2D

signal dale4
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_apagado_4_body_entered(body):
	await get_tree().create_timer(6).timeout
	get_node("Dale4").self_modulate.a = 0.1
	get_node("Luces41").texture_scale = 0.95
	get_node("Luces42").texture_scale = 0.95
	get_node("Luces43").texture_scale = 0.95
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.9
	get_node("Luces42").texture_scale = 0.9
	get_node("Luces43").texture_scale = 0.9
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.85
	get_node("Luces42").texture_scale = 0.85
	get_node("Luces43").texture_scale = 0.85
	get_node("Dale4").self_modulate.a = 0.2
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.8
	get_node("Luces42").texture_scale = 0.8
	get_node("Luces43").texture_scale = 0.8
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.75
	get_node("Luces42").texture_scale = 0.75
	get_node("Luces43").texture_scale = 0.75
	get_node("Dale4").self_modulate.a = 0.3
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.7
	get_node("Luces42").texture_scale = 0.7
	get_node("Luces43").texture_scale = 0.7
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.65
	get_node("Luces42").texture_scale = 0.65
	get_node("Luces43").texture_scale = 0.65
	get_node("Dale4").self_modulate.a = 0.4
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.6
	get_node("Luces42").texture_scale = 0.6
	get_node("Luces43").texture_scale = 0.6
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.55
	get_node("Luces42").texture_scale = 0.55
	get_node("Luces43").texture_scale = 0.55
	get_node("Dale4").self_modulate.a = 0.5
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.5
	get_node("Luces42").texture_scale = 0.5
	get_node("Luces43").texture_scale = 0.5
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.45
	get_node("Luces42").texture_scale = 0.45
	get_node("Luces43").texture_scale = 0.45
	get_node("Dale4").self_modulate.a = 0.6
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.4
	get_node("Luces42").texture_scale = 0.4
	get_node("Luces43").texture_scale = 0.4
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.35
	get_node("Luces42").texture_scale = 0.35
	get_node("Luces43").texture_scale = 0.35
	get_node("Dale4").self_modulate.a = 0.7
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.3
	get_node("Luces42").texture_scale = 0.3
	get_node("Luces43").texture_scale = 0.3
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.25
	get_node("Luces42").texture_scale = 0.25
	get_node("Luces43").texture_scale = 0.25
	get_node("Dale4").self_modulate.a = 0.8
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.2
	get_node("Luces42").texture_scale = 0.2
	get_node("Luces43").texture_scale = 0.2
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.15
	get_node("Luces42").texture_scale = 0.15
	get_node("Luces43").texture_scale = 0.15
	get_node("Dale4").self_modulate.a = 0.9
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.1
	get_node("Luces42").texture_scale = 0.1
	get_node("Luces43").texture_scale = 0.1
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.05
	get_node("Luces42").texture_scale = 0.05
	get_node("Luces43").texture_scale = 0.05
	get_node("Dale4").self_modulate.a = 1
	await get_tree().create_timer(1.5).timeout
	get_node("Luces41").texture_scale = 0.1
	get_node("Luces42").texture_scale = 0.1
	get_node("Luces43").texture_scale = 0.1
	get_node("Dale4").self_modulate.a = 0.9
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.15
	get_node("Luces42").texture_scale = 0.15
	get_node("Luces43").texture_scale = 0.15
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.2
	get_node("Luces42").texture_scale = 0.2
	get_node("Luces43").texture_scale = 0.2
	get_node("Dale4").self_modulate.a = 0.8
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.25
	get_node("Luces42").texture_scale = 0.25
	get_node("Luces43").texture_scale = 0.25
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.3
	get_node("Luces42").texture_scale = 0.3
	get_node("Luces43").texture_scale = 0.3
	get_node("Dale4").self_modulate.a = 0.7
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.35
	get_node("Luces42").texture_scale = 0.35
	get_node("Luces43").texture_scale = 0.35
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.4
	get_node("Luces42").texture_scale = 0.4
	get_node("Luces43").texture_scale = 0.4
	get_node("Dale4").self_modulate.a = 0.6
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.45
	get_node("Luces42").texture_scale = 0.45
	get_node("Luces43").texture_scale = 0.45
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.5
	get_node("Luces42").texture_scale = 0.5
	get_node("Luces43").texture_scale = 0.5
	get_node("Dale4").self_modulate.a = 0.5
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.55
	get_node("Luces42").texture_scale = 0.55
	get_node("Luces43").texture_scale = 0.55
	await get_tree().create_timer(0.10).timeout
	get_node("Dale4").self_modulate.a = 0.4
	get_node("Luces41").texture_scale = 0.6
	get_node("Luces42").texture_scale = 0.6
	get_node("Luces43").texture_scale = 0.6
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.65
	get_node("Luces42").texture_scale = 0.65
	get_node("Luces43").texture_scale = 0.65
	await get_tree().create_timer(0.10).timeout
	get_node("Dale4").self_modulate.a = 0.3
	get_node("Luces41").texture_scale = 0.7
	get_node("Luces42").texture_scale = 0.7
	get_node("Luces43").texture_scale = 0.7
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.75
	get_node("Luces42").texture_scale = 0.75
	get_node("Luces43").texture_scale = 0.75
	await get_tree().create_timer(0.10).timeout
	get_node("Dale4").self_modulate.a = 0.2
	get_node("Luces41").texture_scale = 0.8
	get_node("Luces42").texture_scale = 0.8
	get_node("Luces43").texture_scale = 0.8
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.85
	get_node("Luces42").texture_scale = 0.85
	get_node("Luces43").texture_scale = 0.85
	await get_tree().create_timer(0.10).timeout
	get_node("Dale4").self_modulate.a = 0.1
	get_node("Luces41").texture_scale = 0.9
	get_node("Luces42").texture_scale = 0.9
	get_node("Luces43").texture_scale = 0.9
	await get_tree().create_timer(0.10).timeout
	get_node("Luces41").texture_scale = 0.95
	get_node("Luces42").texture_scale = 0.95
	get_node("Luces43").texture_scale = 0.95
	await get_tree().create_timer(0.10).timeout
	get_node("Dale4").self_modulate.a = 0
	get_node("Luces41").texture_scale = 1
	get_node("Luces42").texture_scale = 1
	get_node("Luces43").texture_scale = 1
	await get_tree().create_timer(0.10).timeout
	emit_signal("dale4")
