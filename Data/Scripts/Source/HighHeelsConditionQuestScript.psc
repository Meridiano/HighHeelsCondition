ScriptName HighHeelsConditionQuestScript Extends Quest

Spell Property HighHeelsConditionSpell Auto

Bool Function ActorHasHHActive(Actor akActor)
	If (akActor as Bool)
		Bool bFemale = akActor.GetLeveledActorBase().GetSex() as Bool
		String[] TransformKeys = NiOverride.GetNodeTransformKeys(akActor, False, bFemale, "NPC")
		Debug.Trace(akActor as String + " / HighHeelsConditionQuestScript.ActorHasHHActive >> TransformKeys = " + TransformKeys as String)
		Return (TransformKeys.Find("internal") >= 0)
	EndIf
	Return False
EndFunction

Function ApplyConditionSpell(Actor akActor, Bool bForce = False, Bool bForceValue = False)
	If (akActor as Bool)
		If bForce
			If bForceValue
				Bool Result = AddConditionSpell(akActor)
				Debug.Trace(akActor as String + " / HighHeelsConditionQuestScript.ApplyConditionSpell >> Forced Add / Result = " + Result as String)
			Else
				Bool Result = RemoveConditionSpell(akActor)
				Debug.Trace(akActor as String + " / HighHeelsConditionQuestScript.ApplyConditionSpell >> Forced Remove / Result = " + Result as String)
			EndIf
		Else
			If ActorHasHHActive(akActor)
				Bool Result = AddConditionSpell(akActor)
				Debug.Trace(akActor as String + " / HighHeelsConditionQuestScript.ApplyConditionSpell >> Heels Enabled / Result = " + Result as String)
			Else
				Bool Result = RemoveConditionSpell(akActor)
				Debug.Trace(akActor as String + " / HighHeelsConditionQuestScript.ApplyConditionSpell >> Heels Disabled / Result = " + Result as String)
			EndIf
		EndIf
	EndIf
EndFunction

Bool Function AddConditionSpell(Actor akActor)
	If (akActor as Bool) && !akActor.HasSpell(HighHeelsConditionSpell)
		akActor.AddSpell(HighHeelsConditionSpell, False)
		Return akActor.HasSpell(HighHeelsConditionSpell)
	EndIf
	Return False
EndFunction

Bool Function RemoveConditionSpell(Actor akActor)
	If (akActor as Bool) && akActor.HasSpell(HighHeelsConditionSpell)
		akActor.RemoveSpell(HighHeelsConditionSpell)
		Return !akActor.HasSpell(HighHeelsConditionSpell)
	EndIf
	Return False
EndFunction
