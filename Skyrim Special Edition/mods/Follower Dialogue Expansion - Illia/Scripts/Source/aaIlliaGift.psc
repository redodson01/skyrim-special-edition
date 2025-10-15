Scriptname aaIlliaGift extends Quest  Conditional

Int Property GiftCD  Auto  Conditional

Actor Property Caesia  Auto  

FormList Property CaesiaGiftsList  Auto  
Topic Property CaesiaGivenGift  Auto  

Topic Property CaesiaGivenNoGift0  Auto  
FRDisp Property FR  Auto  

Int Property GreatGift  Auto  Conditional
Quest Property fronmundgiftquest  Auto  

Function openGiftInventory()
int giftValue = Caesia.ShowGiftMenu(true, CaesiaGiftsList, true, false)

If (giftValue >= 1000)
	gift.greatgift=1
	caesia.say(caesiagivengift)
	fr.rom(1)
	fr.acc(1)
	gift.greatgift=0
	gift.giftcd=1
	registerforsingleupdategametime(24)
Elseif (giftValue >= 1) && (giftValue < 1000)
	caesia.say(caesiagivengift)
	fr.rom(1)
	gift.giftcd=1
	registerforsingleupdategametime(24)
Else
	caesia.say(caesiagivennogift0)
	fr.dis(-1)
	gift.giftcd=1
	registerforsingleupdategametime(24)
EndIf
EndFunction

Event OnUpdateGameTime()
	gift.giftcd=0
EndEvent

FROnmundGift Property gift  Auto  

