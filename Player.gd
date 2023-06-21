extends CharacterBody2D

const SPEED = 200.0 # velocidade
const JUMP_VELOCITY = -300.0 # Força do pulo

# Usar gravidade das configurações padrões do projeto.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")





func _physics_process(delta):
	
	# Pegar a direção de entrada e controle o movimento/desaceleração.
	# Boa prática : substituir as ações da interface do usuário por ações de jogo personalizadas.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		if direction>0:
			# Personagem movendo para direita
			print("direita ->")
			$Sprite2D.play("Run")
			$Sprite2D.flip_h = false
		else:
			# Personagem movendo para esquerda
			print("<- esquerda")
			$Sprite2D.play("Run")
			$Sprite2D.flip_h = true
		velocity.x = direction * SPEED
	else:
		# Personagem parado
		$Sprite2D.play("Ide")
		velocity.x = 0#move_toward(velocity.x, 0, SPEED)
			
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			# Iniciar salto.
			$Sprite2D.play("jump")
			velocity.y = JUMP_VELOCITY	
	else:
		# Se não estiver encostando no chão
		$Sprite2D.play("falling") # Animação caindo
		velocity.y += gravity * delta # Personagem cai (Adicione a gravidade).


	move_and_slide()
