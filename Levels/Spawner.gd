extends Spatial


onready var timer = $Timer

export var enemy : PackedScene

export var spawns : Array = [
	NodePath(""), NodePath(""), 
	NodePath(""), NodePath(""), 
	NodePath(""), NodePath(""), 
	NodePath(""), NodePath("")]


func _ready():
	
	timer.connect("timeout", self, "spawn")
	

func spawn():
	
	for all in range(0,floor(Globals.count)):
		
		var rand = rand_range(0,spawns.size() - 1)
		
		$Timer.wait_time = Globals.time - .1
		
		var spawn = get_node(spawns[rand])
		
		var inst = enemy.instance()
		
		inst.translation = spawn.translation
		
		
		get_parent().add_child(inst)
		
		Globals.count += .15
		
	
