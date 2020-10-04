extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(type==1):
		$enemy.set_collision_layer(0)
		set_collision_layer(0)
export (int)var type=0
func areaCheck(body):
	for i in $enemy.get_overlapping_areas():
		
		
		var l = i.get_collision_layer();
		if(l==4):
			if(body.get_name()!="enemy"):
				queue_free()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
var t = 0;
var dir =1
func _process(delta):
	var vec = Vector2(0,20)
	#areaCheck()
	t+=delta*60
	if(t>30):
		$sprite.frame=1+type*2
		if(type==0):
			vec.x+=(t-60)*4*dir
		if(t>60):
			$sprite.frame=0+type*2
			
			t=0
	move_and_slide(vec,Vector2(0,-1))
	if(is_on_wall()):
		scale.x*=-1
		dir*=-1
		pass
