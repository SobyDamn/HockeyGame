extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$RestartButton.hide() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func show_respawn_timer(timer):
	$RespawnTimer.text = "Ready\n" + str(timer)
	$RespawnTimer.show()
func right_scored(goal):
	$RightScored.text = str(goal)
func left_scored(goal):
	$LeftScored.text = str(goal)
func remove_respawn_timer():
	$RespawnTimer.hide() #hide timer after spawning no shit on screen
func who_winner(winner):
	$Winner.show()
	$Winner.text = str(winner)
	$RestartButton.show()
func clean_restart(): #hiding text and button
	$RestartButton.hide()
	$Winner.hide()



