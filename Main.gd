extends Node2D
signal new_game
var max_goal

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Game.clean_start()
	$MAIN_HUD.show()
	$Game/SettingScreen.hide_settings() # Replace with function body.
func clear_screen():
	$MainMenu_background.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	$MainMenu_background.hide()
	emit_signal("new_game") #fix the parent tree dependency for better use later


func _on_SettingButton_pressed():
	#get_tree().change_scene("res://SettingNew.tscn")
	$MAIN_HUD.hide()
	$Game/SettingScreen.show_settings()

