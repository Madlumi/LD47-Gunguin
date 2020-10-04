extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func callName():
	return name
var gs = 1;

var grav = 50
export (int) var ms = 250
var mom = 0
var acc= 30
var velocity = Vector2()
var t = 0
var bul = preload("res://objects/bullet.tscn")
var cp = Vector2()
func areaCheck(body):	
	var l = body.get_collision_layer();
	if(body.get_name()=="gem"):
			get_node("/root/main").cred()
	if(l==4):
		if(body.get_name()=="bullet"):
			get_node("/root/main").img(0)
		if("pit" in body.get_name()):
			get_node("/root/main").img(1)
		if("deep" in body.get_name()):
			get_node("/root/main").img(3)
		if(body.get_name()=="enemy"):
			get_node("/root/main").img(2)
		
		position = cp
	
	elif(l==12):
		cp = position	
		
		
var dir =1
var jumpable=0

func _physics_process(delta):
	if(get_node("/root/main").active):
		#areaCheck()
		t+=delta*60
		if(t>10000):
			t=0
		
		
		velocity.y += grav
		velocity.x = 0
		$Sprite.frame=int(t/30)%4
		if Input.is_action_pressed('ui_right'):
			dir =1
			mom+=acc
			if(mom>ms):
				mom=ms
			velocity.x += 1*mom
			
		if Input.is_action_pressed('ui_left') :
			dir=-1
			mom+=acc
			if(mom>ms):
				mom=ms
			velocity.x -= 1*mom
		#if Input.is_action_pressed('ui_down'):
		#	velocity.y += 1
		$Sprite.set_scale(Vector2(dir,1))
		if(abs(velocity.x)>.1):
			$Sprite.frame=int(t/15)%4+4
			
		
		
		if Input.is_action_just_pressed("ui_accept"):
			
			var b = bul.instance()
			b.init(position+Vector2(8*dir,0),300*dir+velocity.x,-10,5)
			get_parent().add_child(b)
		if Input.is_action_pressed('ui_up')and jumpable>0:
			velocity.y=-500
			jumpable=0
		
		velocity = move_and_slide(velocity,Vector2(0,-1))
		
		if(is_on_floor()):
			jumpable=1
		else:
			jumpable=0
