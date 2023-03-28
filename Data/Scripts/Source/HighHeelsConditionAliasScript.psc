ScriptName HighHeelsConditionAliasScript Extends ReferenceAlias

Actor Property PlayerActor
	Actor Function Get()
		If (PlayerActorLocal as Bool)
			Return PlayerActorLocal
		Else
			PlayerActorLocal = Self.GetReference() as Actor
		EndIf
		Return PlayerActorLocal
	EndFunction
EndProperty
GlobalVariable Property HighHeelsDelayTimer Auto
HighHeelsConditionQuestScript Property HighHeelsConditionQuest Auto

Actor PlayerActorLocal = None

Event OnInit()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	HighHeelsConditionQuest.ApplyConditionSpell(PlayerActor)
EndEvent

Event OnPlayerLoadGame()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	HighHeelsConditionQuest.ApplyConditionSpell(PlayerActor)
EndEvent

Event OnObjectEquipped(Form BaseObject, ObjectReference Reference)
	If (BaseObject as Armor != None)
		HighHeelsConditionQuest.ApplyConditionSpell(PlayerActor)
	EndIf
EndEvent

Event OnObjectUnequipped(Form BaseObject, ObjectReference Reference)
	If (BaseObject as Armor != None)
		HighHeelsConditionQuest.ApplyConditionSpell(PlayerActor)
	EndIf
EndEvent
