extends StaticBody2D

signal s1
signal s2
signal s3

var direccion = false
var start = false
var i_posx = 792
var i_posy = 376
var stop = true
var abajo = false
var arriba = false
var derecha = false
var izquierda = false
var mov = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if start:      #lo que va a durar un movimiento
		if !stop:
			start = false
			if !stop:
				await get_tree().create_timer(1).timeout
				if !stop:
					await get_tree().create_timer(1).timeout
					if !stop:
						await get_tree().create_timer(1).timeout
						if !stop:
							await get_tree().create_timer(1).timeout
							emit_signal("s1")
					
	if direccion:     
		direccion = false  #el recorrido completo spriteado
		mov = 1
		start = true
		await s1
		if !stop:
			mov = 2
			start = true
			await s1
			if !stop:
				mov = 0
	
	if stop:          #paron y reinicio de posicion si se cae
		await s2
		mov = 0
		position.x = i_posx
		position.y = i_posy
	
	if mov == 0:       #cambio de direccion
		derecha = false
		abajo = false
		arriba = false
		izquierda = false
		
	if mov == 1:
		derecha = true
		abajo = false
		arriba = false
		izquierda = false
		
	if mov == 2:
		abajo = true
		derecha = false
		arriba = false
		izquierda = false
		
	if derecha:   #velocidad del movimiento
		position.x += 1 * (0.017/delta)
		
	if abajo:
		position.y += 1 * (0.017/delta)
		
	if izquierda:
		position.x -= 1 * (0.017/delta)
		
	if arriba:
		position.y -= 1 * (0.017/delta)
	
	

func _on_aaveh_body_entered(body):
	direccion = true
	stop = false
	pass


func _on_aaveh_body_exited(body):
	direccion = false
	stop = true
	emit_signal("s2")
	pass
