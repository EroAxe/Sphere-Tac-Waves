extends Entity



func _ready():
	
	Globals.player = self
	
	connect("dead", self, "restart")
	

func restart(xp, lvl):
	
	get_tree().reload_current_scene()
	


func _physics_process(delta):
	
	var input = Input.get_vector("left", "right", "up", "down")
	
	var dir = (transform.basis * Vector3(input.x, 0, input.y)).normalized()
	
	if !is_on_floor():
		
		vel.y -= grav * delta
		
	
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		
		vel.y = jump_spd
		
	
	
	if dir.length() > 0:
		
		vel.x = dir.x * spd
		vel.z = dir.z * spd
		
	else:
		
		vel.x = move_toward(vel.x, 0, spd)
		vel.z = move_toward(vel.z, 0, spd)
		
	
	
	move_and_slide(vel, Vector3.UP)
	

func _unhandled_input(event):
	
	if event is InputEventMouseMotion:
		
		rotate_y(deg2rad(-event.relative.x))
		
		$SpringArm.rotate_x(deg2rad(-event.relative.y))
		
		$SpringArm.rotation.x = clamp($SpringArm.rotation.x, deg2rad(-90), deg2rad(-15))
		
	
	if event.is_action("attack"):
		
		attack()
		
	
