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
	
	var rand = rand_range(0,spawns.size() - 1)
	
	$Timer.wait_time -= .2
	
	var spawn = get_node(spawns[rand])
	
	var inst = enemy.instance()
	
	inst.translation = spawn.translation
	
	
	get_parent().add_child(inst)
	
