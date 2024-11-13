extends Node2D


@export var cards: Array[Card]

@export var cards_to_spawn: int = 3
@export var panel: Container
@export var card_template: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	for i in range(cards_to_spawn):
		var rnd = randi()%100+1
		var size = Enums.Rarities.size()
		var rarity
		for j in range(size):
			if rnd <= Enums.Rarities.values()[size-j-1]:
				rarity = Enums.Rarities.values()[size-j-1]
				break
				
		var cards_with_rarity: Array[Card] = []
		for c in cards:
			if c.rarity == rarity:
				cards_with_rarity.append(c)
		
		var card_to_draw
		if cards_with_rarity.size() == 0:
			print("there is no card with the rarity: " + str(rnd))
		else:
			card_to_draw = cards_with_rarity[randi()%cards_with_rarity.size()]
			
		var card = card_template.instantiate()
		card.get_child(0).texture = card_to_draw.texture
		card.get_child(1).text = card_to_draw.name
		card.get_child(2).text = '[center][font_size="10px"]'+ card_to_draw.description + '[/font_size][/center]'
		card.pressed.connect(_on_button_pressed.bind(card_to_draw.id))
		panel.add_child(card)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed(id: int):
	print("button pressed: " + str(id))
