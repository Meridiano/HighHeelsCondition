ScriptName HighHeelsConditionAliasScript Extends ReferenceAlias

Actor Property Player = None Auto Hidden
GlobalVariable Property HighHeelsDelayTimer Auto
HighHeelsConditionQuestScript Property HighHeelsConditionQuest Auto

Event OnInit()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	Player = Self.GetReference() as Actor
	HighHeelsConditionQuest.ApplyConditionSpell(Player)
EndEvent

Event OnPlayerLoadGame()
	Utility.Wait(Math.Abs(HighHeelsDelayTimer.GetValue()))
	Player = Self.GetReference() as Actor
	HighHeelsConditionQuest.ApplyConditionSpell(Player)
EndEvent

Event OnObjectEquipped(Form BaseObject, ObjectReference Reference)
	HighHeelsConditionQuest.ApplyConditionSpell(Player)
EndEvent

Event OnObjectUnequipped(Form BaseObject, ObjectReference Reference)
	HighHeelsConditionQuest.ApplyConditionSpell(Player)
EndEvent
