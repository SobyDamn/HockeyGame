extends RigidBody2D
var screen_size
var is_goal = true




# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	
func _physics_process(delta):
	#reset_position()
	pass

	#position.x = clamp(position.x,43,screen_size.x - 43)
	#position.y = clamp(position.y,43,screen_size.y - 43)
	
		


func start_pos(pos):
	position = pos

func start_vel():
	linear_velocity = Vector2(0,0)
	angular_velocity = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ScoreSide_goal():
	pass
	

func clean_screen():
	hide()
func bacc_normal(): #calling node  to be visible
	show()
func _on_Visibility_screen_exited():
	pass
	#queue_free() #Deleting the ball
