extends Node2D

@onready var score_sound = $ScoreSound



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= GameManager.SCROLL_SPEED * delta



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_lower_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		body.die_on_floor()


func _on_laser_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		score_sound.play()
		GameManager.increment_score()
		
