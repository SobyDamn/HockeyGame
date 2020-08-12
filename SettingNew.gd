extends CanvasLayer
var respawn_time
signal set_goals
var max_goals = []
var value_changed
var newSetting = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Goals/MaxGoals.text = str(max_goals)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_SaveAndReturn_pressed():
	hide_settings()
	var new_goal_value = $Goals/MaxGoals.text
	max_goals.clear()
	max_goals.append(new_goal_value)
	print("goal is " + str(max_goals))
	emit_signal("set_goals")
	#get_tree().change_scene("res://Main.tscn")
	
	

func _on_MaxGoals_text_changed(new_text):
	print("setting received new goals" + str(new_text))
	value_changed = true


func _on_RespawnTimer_text_changed(new_text):
	respawn_time = int(new_text)
	
func hide_settings(): #dont show it unless asked
	$Goals.hide()
	$RespawnTime.hide()
	$SaveAndReturn.hide()
	
func show_settings(): #dont show it unless asked
	$Goals.show()
	$RespawnTime.show()
	$SaveAndReturn.show()
	




func _on_SettingScreen_set_goals():
	$Goals.free()
	 # Replace with function body.
