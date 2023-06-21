extends Node


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused==false:
			print("Jogo Pausado")
			get_tree().paused = true #Pausa o jogo no Godot
			# $Label.visible = true
		else:
			print("Jogo Play")
			get_tree().paused = false #Pausa o jogo no Godot
			# $Label.visible = true
			
