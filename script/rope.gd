extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var PIECE = preload("res://objects/chainlink.tscn")

export (int) var pieces = 50
func callName():
	return name
	
func _ready():
	$Player.setPole(position)
	
	var col = $Anchor
	for i in range(pieces):
		
		col = addPiece(col)
	
	var joint = col.get_node("col/joint")
	var piece= $Player
	joint.add_child(piece)
	joint.node_a = col.get_path()
	joint.node_b = piece.get_path()
	return piece
	
		
		
func addPiece(parent):
	var joint = parent.get_node("col/joint")
	var piece= PIECE.instance()
	joint.add_child(piece)
	joint.node_a = parent.get_path()
	joint.node_b = piece.get_path()
	return piece



