extends Area



var killed : int


func _ready():
	
	Globals.level_end = self
	
	connect("body_entered", self, "win")
	
	$CanvasLayer/Button.connect("pressed", self, "replay")
	

func _input(event):
	
	if event.is_action("escape"):
		
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	

func killed_enemy(xp, level):
	
	killed += 1
	
	$"../CanvasLayer/Label2".text = str(killed)
	
	if killed >= Globals.goal:
		
		visible = true
		
		monitoring = true
		
	

func win(body):
	
	if "Player" in body.name:
		
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		Globals.goal += 2
		
		Globals.multiplier += .25
		
		Globals.count *= 1.35
		
		
		$CanvasLayer/Label.visible = true
		
		$CanvasLayer/Button.visible = true
		
		$CanvasLayer/Score.visible = true
		
		$CanvasLayer/Score.text = "Score: " + str(killed * Globals.multiplier)
		
		get_tree().paused = true
	

func replay():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	get_tree().paused = false
	
	get_tree().reload_current_scene()
	
