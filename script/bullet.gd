extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func init(pos,vx,vy,lay):
	position=pos
	
	linear_velocity.x=vx
	linear_velocity.y=vy
	$bullet.set_collision_layer(lay)
	$aud2.play()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var blow = 0
var p=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(blow>1):
		blow+=delta*60
	elif(linear_velocity.x*linear_velocity.x+linear_velocity.y*linear_velocity.y<150):
		blow +=10
		$bullet.set_collision_layer(1)
	if(blow>30):
		if(p==1):
			$aud.play()
			p=0
		$bullet.set_collision_layer(4)
	if(blow>37):
		$bullet.set_collision_layer(0)
		rotation_degrees=0
		$exp.visible=true
		$bullet.set_scale(Vector2((blow-30)/4+1,(blow-30)/4+1))
		$exp.frame=(blow-30)/4
	if(blow>54):
		free()
	
