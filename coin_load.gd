extends Node

var coin_scene

func _ready():
	coin_scene = preload("res://Coin.tscn")
	
	var num_coins = rand_range(1, 100)
	for i in range(1, num_coins):
		add_child(coin_scene.instance())