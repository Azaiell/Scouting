extends Area2D


func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if get_node("CamaraSala21").enabled:
		show()
		
	if !get_node("CamaraSala21").enabled:
		hide()
