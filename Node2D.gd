extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bul = preload("res://objects/cloudsmall.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 30:
		spwncloud()
	pass # Replace with function body.
func spwncloud():
		var b = bul.instance()
		
		add_child(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if(rand_range(0,100)==1):
	#	spwncloud()
	pass
