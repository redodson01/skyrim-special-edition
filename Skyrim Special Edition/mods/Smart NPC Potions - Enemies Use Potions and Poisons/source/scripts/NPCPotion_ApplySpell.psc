Scriptname NPCPotion_ApplySpell extends ReferenceAlias  
Spell Property NPCpotions_Spell auto

Event OnInIt()

if self.GetActorRef() != none
Actor npc = self.GetActorRef()
npc.AddSpell(NPCpotions_Spell)
Clear()
endif
EndEvent