extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#Player/cam/ui
var active = true

func img(i):
	get_node("/root/main/Player/cam/ui").showImg(i)
	active=false
func txt(t):
	get_node("/root/main/Player/cam/ui").setTxt(t)

func cred():
	active=false
	run=1

func _ready():
	active=false
	get_node("/root/main/Player/cam/ui").showImg(4)
	
var run =-10
func _process(delta):
	if(run==-10):
		get_node("/root/main/Player/cam/ui").timer=5
		if Input.is_action_pressed("ui_accept"):
			run=-9
	elif(run==-9):
		get_node("/root/main/Player/cam/ui").showImg(5)
		get_node("/root/main/Player/cam/ui").timer=60
		run=-8
	elif(run==-8 and get_node("/root/main/Player/cam/ui").timer<=5):
		get_node("/root/main/Player/cam/ui").showImg(6)
		get_node("/root/main/Player/cam/ui").timer=60
		run=-7
	elif(run==-7 and get_node("/root/main/Player/cam/ui").timer<=5):
		get_node("/root/main/Player/cam/ui").showImg(7)
		get_node("/root/main/Player/cam/ui").timer=60
		run=-6
	elif(run==-6 and get_node("/root/main/Player/cam/ui").timer<=5):
		run=0
		
	if(run==1):
		get_node("/root/main/Player/cam/ui").showImg(8)
		get_node("/root/main/Player/cam/ui").timer=60
		run=2
	elif(run==2 and get_node("/root/main/Player/cam/ui").timer<=5):
		get_node("/root/main/Player/cam/ui").showImg(9)
		get_node("/root/main/Player/cam/ui").timer=60
		run=3
	elif(run==3 and get_node("/root/main/Player/cam/ui").timer<=5):
		get_node("/root/main/Player/cam/ui").showImg(10)
		get_node("/root/main/Player/cam/ui").timer=60
		run=4
	elif(run==4 and get_node("/root/main/Player/cam/ui").timer<=5):
		get_node("/root/main/Player/cam/ui").showImg(13)
		get_node("/root/main/Player/cam/ui").timer=60
		run=5
	elif(run==5 and get_node("/root/main/Player/cam/ui").timer<=5):
		get_node("/root/main/Player/cam/ui").showImg(11)
		get_node("/root/main/Player/cam/ui").timer=60
		run=6
	elif(run==6 and get_node("/root/main/Player/cam/ui").timer<=5):
		get_node("/root/main/Player/cam/ui").showImg(12)
		get_node("/root/main/Player/cam/ui").timer=60
		run=6
	
	if(get_node("/root/main/Player/cam/ui").timer<=0 and run==0):
		active=true
