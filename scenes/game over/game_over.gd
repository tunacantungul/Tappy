extends Control

@onready var game_over = $GameOver
@onready var space = $Space
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)
	
func on_plane_died():
	game_over_sound.play()
	show()
	timer.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if space.visible == true and Input.is_action_just_pressed("fly") == true:
		GameManager.load_main_scene()


func _on_timer_timeout():
	game_over.hide()
	space.show()
