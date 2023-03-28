ScriptName HighHeelsConditionEffectScript Extends ActiveMagicEffect

Actor Property SelfActor
	Actor Function Get()
		If (SelfActorLocal as Bool)
			Return SelfActorLocal
		Else
			SelfActorLocal = Self.GetTargetActor()
		EndIf
		Return SelfActorLocal
	EndFunction
EndProperty
GlobalVariable Property HighHeelsDelayTimer Auto
HighHeelsConditionQuestScript Property HighHeelsConditionQuest Auto

Actor SelfActorLocal = None

Event OnLoad()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	HighHeelsConditionQuest.ApplyConditionSpell(SelfActor)
EndEvent

Event OnUnload()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	HighHeelsConditionQuest.ApplyConditionSpell(SelfActor, True, False)
EndEvent

Event OnObjectEquipped(Form BaseObject, ObjectReference Reference)
	If (BaseObject as Armor != None)
		HighHeelsConditionQuest.ApplyConditionSpell(SelfActor)
	EndIf
EndEvent

Event OnObjectUnequipped(Form BaseObject, ObjectReference Reference)
	If (BaseObject as Armor != None)
		HighHeelsConditionQuest.ApplyConditionSpell(SelfActor)
	EndIf
EndEvent
