extends Node2D



var gs = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var enemy = preload("res://objects/enemy.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
var t = 0
func _process(delta):
	delta*=gs
	t+=delta*60
	if(t>60):
		t=0
		print(1)
		var e = enemy.instance()
		e.init(Vector2(rand_range(-20,60),rand_range(-20,20)))
		self.add_child(e)
