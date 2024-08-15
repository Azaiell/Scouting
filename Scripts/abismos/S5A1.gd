extends Area2D

signal caete
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_azucena_cambio_2():
	if get_node("/root/Global").where == 5:
		emit_signal("caete")
		#print("me entero2
