scriptName AddHBTBPerktoplayer extends quest

perk property HBTBPerk auto

Event OnInit()
	Debug.notification("Init")
	Game.getplayer().addperk(HBTBPerk)
endEvent
