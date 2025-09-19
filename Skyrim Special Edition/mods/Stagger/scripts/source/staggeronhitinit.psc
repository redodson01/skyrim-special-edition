scriptName staggeronhitinit extends quest

faction property fullBody auto
perk property sgc_staggerperkplayer auto

function Oninit()
	Game.getplayer().AddToFaction(fullBody)
	Game.getplayer().addperk(sgc_staggerperkplayer)
endFunction
