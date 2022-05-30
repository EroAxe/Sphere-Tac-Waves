extends KinematicBody
class_name Entity


signal dead()

signal dmg(dmg)

# Stats
export var hp := 10

export var dmg := 10

# Movement Values
export var spd := 20

export var jump_spd := 10

export var grav := 15

# Level Stats

export var lvl := 1

export var xp := 10

# Node Paths
export (NodePath) var Animation_Player

onready var animator = get_node(Animation_Player)


export (NodePath) var attack_path

onready var atk_box = get_node(attack_path)


export (NodePath) var hitbox_path

onready var hitbox = get_node(hitbox_path)

""" LOCAL VARIABLES """

var vel := Vector3.ZERO


func _ready():
	
	hitbox.connect("area_entered", self, "on_hit")
	
#	animator.connect("animation_finished", self, "anim_over")
	

func on_hit(body, death = null):
	
	if death:
		
		emit_signal("dead", xp, lvl)
		
		return
		
	
	if "Attack" in body.name:
		
		var dmg = body.get_parent().dmg
		
		hp -= dmg
		
		
		if hp <= 0:
			
			connect("dead", body, "target_dead")
			
			queue_free()
			
			emit_signal("dead", xp, lvl)
			
			emit_signal("dmg", dmg)
			
		
	

func attack():
	
	atk_box.monitoring = true
	
	atk_box.monitorable = true
	
	animator.play("attack")
	
