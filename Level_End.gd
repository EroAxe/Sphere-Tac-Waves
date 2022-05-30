extends Area



var killed : int

export var goal : int = 1


func _ready():
	
	Globals.level_end = self
	
	connect("body_entered", self, "win")
	
	$CanvasLayer/Button.connect("pressed", self, "replay")
	

func killed_enemy(xp, level):
	
	killed += 1
	
	$"../CanvasLayer/Label2".text = str(killed)
	
	if killed >= goal:
		
		visible = true
		
		monitoring = true
		
	

func win(body):
	
	$CanvasLayer/Label.visible = true
	
	$CanvasLayer/Button.visible = true
	
	get_tree().paused = true
	

func replay():
	
	get_tree().paused = false
	
	get_tree().reload_current_scene()
	
