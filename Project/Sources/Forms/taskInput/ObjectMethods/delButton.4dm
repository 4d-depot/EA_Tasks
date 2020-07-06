OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)

CONFIRM:C162("Are you sure you want to delete this task?";"Yes";"Cancel")
If (OK=1)
	lastModifiedTask_e:=Form:C1466.ent
	
	If (Form:C1466.isNewWindow)
		taskAction_t:="On Deleting Task"
		ACCEPT:C269
	Else 
		CALL SUBFORM CONTAINER:C1086(-2)  // On Delete Button clicked
	End if 
End if 