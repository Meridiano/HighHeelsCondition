ScriptName HighHeelsConditionEffectScript Extends ActiveMagicEffect

Actor Property SelfActor = None Auto Hidden
GlobalVariable Property HighHeelsDelayTimer Auto
HighHeelsConditionQuestScript Property HighHeelsConditionQuest Auto

Event OnLoad()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	SelfActor = Self.GetTargetActor()
	HighHeelsConditionQuest.ApplyConditionSpell(SelfActor)
EndEvent

Event OnUnload()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	HighHeelsConditionQuest.ApplyConditionSpell(SelfActor, True, False)
	SelfActor = None
EndEvent

Event OnObjectEquipped(Form BaseObject, ObjectReference Reference)
	HighHeelsConditionQuest.ApplyConditionSpell(SelfActor)
EndEvent

Event OnObjectUnequipped(Form BaseObject, ObjectReference Reference)
	HighHeelsConditionQuest.ApplyConditionSpell(SelfActor)
EndEvent
