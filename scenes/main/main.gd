extends Control

@onready var high_score = $MarginContainer/HighScore

# Called when the node enters the scene tree for the first time.
func _ready():
	high_score.text = str(GameManager.get_high_score())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly") == true:
		GameManager.load_game_scene()
