Scriptname AfterDeath_CleanOnSave extends ReferenceAlias  

;Actually, it's clean on load

FormList Property CurrentObjects Auto

Event OnPlayerLoadGame()
		AnythingToDisable()
endevent

Function AnythingToDisable()

Form[] Bones

Bones = CurrentObjects.ToArray()

int i                 ;define this variable for use in arrays
i = 0

While i < Bones.Length             ;loop through the stored items

If Bones[i] As ObjectReference
		(Bones[i] as ObjectReference).Disable()
		CurrentObjects.RemoveAddedForm(Bones[i])
		(Bones[i] as ObjectReference).Delete()
EndIf

  i = i +1

EndWhile
EndFunction




