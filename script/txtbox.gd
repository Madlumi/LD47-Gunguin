extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#setTxt("uwu uwu uwu uwu uwuuwuuwu uwuuwu  uwu")
	
	pass # Replace with function body.

var textbuffer=""
var t=0
var timer=0
func setTxt(txt):
	t=0
	textbuffer = txt;
	$ui/Label.set_text("")
	timer = 80
	$ui/Label.show()
	show()

func showImg(frm):
	timer = 20
	$ui/cutscene.frame=frm
	$ui/cutscene.show()
	show()
	textbuffer=""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t+=delta*60
	if(t>2 ):
		t=0
		if(!textbuffer.match($ui/Label.get_text()) and textbuffer != ""):
			$ui/Label.set_text(textbuffer.substr(0,$ui/Label.get_text().length()+1))
			timer=80
		
		
		timer-=1
		if(timer<=0):
			textbuffer=""
			hide()
			$ui/Label.hide()
			$ui/cutscene.hide()
