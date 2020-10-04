extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position=(Vector2(rand_range(-128,128),rand_range(-128,128)))
	#set_constant_linear_velocity(Vector2(rand_range(-250,250),rand_range(-250,250)))
	$cloud.frame=rand_range(0,3)
	$cloud.set_self_modulate(Color(rand_range(.75,1),rand_range(.25,.75),1,1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
