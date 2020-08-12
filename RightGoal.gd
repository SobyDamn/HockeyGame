extends Area2D
signal right_goal
signal right_goal_test(max_goals)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	#$LeftGoal.set_deferred("disable", true)
	#$RightGoal.set_deferred("disable", true)


func _on_RightGoal_body_entered(body):
	emit_signal("right_goal")
	 # Replace with function body.
