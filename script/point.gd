extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
export (Array, String)var txt 
var i = 0
export (int)var type = 0
var cd =0

func _ready():
	connect('area_entered',self,'_on_body_entered')

func _on_body_entered(body):
	if(cd<=0):
		if(body.get_name()=="player"):
			if(i < txt.size()):
				
				get_node("/root/main").txt(txt[i])
				i+=1
				cd=100
	
	
		
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(cd>0):
		cd-=1
