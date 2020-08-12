extends Node
var left_score
var right_score
var max_goal = 3
var respawn_time = 4 # +1 as it will begin from respawn_time - 1
var respawn_timer
var should_reset_pos
var goals

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	#start_game() # Replace with function body.
func start_game():
	$Ball.start_vel()
	$Ball.start_pos($StartPosition.position)
	$PlayerOne.start_pos($P1StartPosition.position)
	$PlayerTwo.start_pos($P2StartPosition.position)
func default_values(goals): #deciding basic values
	max_goal = goals
func new_game():
	reset_ball()
	start_game()
	left_score = 0
	right_score = 0
	$HUD.left_scored(left_score)
	$HUD.right_scored(right_score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	reset_position()
func reset_position():
	if should_reset_pos:
		start_game()
		should_reset_pos = false
		

func reset_ball():
	should_reset_pos = true


func _on_SpawnTimer_timeout():
	respawn_timer -= 1 #will start from 3 and end to 0
	$HUD.show_respawn_timer(respawn_timer)
	#print("timeout")
	if respawn_timer < 1:
		$HUD.remove_respawn_timer()
		reset_ball()
	else:
		$SpawnTimer.start()
	 # Replace with function body.

func _on_RightGoal():
	var max_goal = $SettingScreen/Goals/MaxGoals.text
	print("on right" + str(max_goal))
	left_score += 1
	respawn_timer = respawn_time
	$HUD.left_scored(left_score)
	if left_score < int(max_goal):
		$SpawnTimer.start()
	elif left_score >= int(max_goal):
		$HUD.who_winner("Left Player Wins!")
		


func _on_LeftGoal(): #Right player scored
	right_score += 1
	respawn_timer = respawn_time
	$HUD.right_scored(right_score)
	if right_score < int(max_goal):
		$SpawnTimer.start() #
	elif right_score >= int(max_goal):
		$HUD.who_winner("Right Player Wins!")


func _on_RestartButton_pressed():
	$HUD.clean_restart()
	new_game()

func _on_MAIN_HUD_start_game():
	$PlayerOne.bacc_normal()
	$PlayerTwo.bacc_normal()
	$Ball.bacc_normal()
	new_game()
	 # Replace with function body.
func clean_start():
	$HUD.clean_restart()
	$PlayerOne.clean_screen()
	$PlayerTwo.clean_screen()
	$Ball.clean_screen()




 # Replace with function body.


func _on_MaxGoals_text_changed(new_text):
	default_values(new_text)
	


func _on_SaveAndReturn_pressed():
	print("received in game" + str(max_goal)) # Replace with function body.


func _on_MaxGoals_text_entered(new_text):
	goals = new_text # Replace with function body.


func _on_SettingScreen_set_goals():
	pass # Replace with function body.
