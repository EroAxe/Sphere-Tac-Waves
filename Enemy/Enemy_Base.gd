extends Entity
class_name Enemy


export var atk_distance : float = 5

func _ready():
	
	hitbox.connect("area_entered", self, "on_hit")
	
	connect("dead", Globals.player, "new_follower")
	
	connect("dead", Globals.level_end, "killed_enemy")
	

func _physics_process(delta):
	
	translation = translation.move_toward($"../Player".translation, delta * spd)
	
	var distance = translation.distance_to($"../Player".translation)
	
	look_at($"../Player".translation, Vector3.UP)
	
	if distance <= atk_distance:
		
		print("attacking")
		
		animator.play("attack")
		
	
