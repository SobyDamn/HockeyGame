extends RigidBody2D
export var speed = 600
var screen_size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	
	

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		
		velocity.y -= 100
	if Input.is_action_pressed("ui_down"):
		velocity.y += 100
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 100
	if Input.is_action_pressed("ui_right"):
		velocity.x += 100
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x,screen_size.x/2 + 80,screen_size.x - 80)
	position.y = clamp(position.y,80,screen_size.y - 80)
	
func start_pos(pos):
	position = pos
	
func clean_screen():
	hide()
func bacc_normal(): #calling node  to be visible
	show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
