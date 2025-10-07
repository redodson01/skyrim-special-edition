Scriptname RacistPricesHirelings extends ReferenceAlias  

GlobalVariable Property Hirelinggold Auto
GlobalVariable Property Hireling_BaseGold Auto
Quest Property HireHireQuest Auto
Faction Property DynamicFees_HirelingFaction Auto
Actor Property PlayerRef Auto
Quest Property MQ305 Auto
Quest Property C06 Auto
Quest Property MG08 Auto

Event OnInIt()
float RawPrice
Actor npc = self.GetActorRef()
int Level = npc.GetLevel()

if self.GetActorRef() == none
; nothing
else
npc.AddtoFaction(DynamicFees_HirelingFaction)

RawPrice = Hireling_BaseGold.GetValue()
RawPrice = Rawprice - (RawPrice * (PlayerRef.GetActorValue("Speechcraft") / 100)) 

if npc.GetActorBase().GetRace() == PlayerRef.GetRace() || MQ305.IsCompleted() || C06.IsCompleted() || MG08.IsCompleted()
Rawprice = Rawprice - 250
endif

If Rawprice < 50
Rawprice = 50
endif

HirelingGold.SetValue(RawPrice)
QuestTime()

endif
EndEvent

function QuestTime()
HireHireQuest.UpdateCurrentInstanceGlobal(Hirelinggold)
endfunction