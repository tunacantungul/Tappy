extends CharacterBody2D

#signal on_plane_died

const GRAVITY : float = 1500.0
const POWER : float = -500.0

@onready var animated_sprite = $"Animated Sprite"
@onready var animation_player = $AnimationPlayer
@onready var engine_sound = $EngineSound

func _ready():
	pass 



func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor() == true:
		die_on_floor()
	
func fly():
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("power")
		
func die_on_floor():
	engine_sound.stop()
	animated_sprite.stop()
	set_physics_process(false)
	#on_plane_died.emit()
	SignalManager.on_plane_died.emit()
	
