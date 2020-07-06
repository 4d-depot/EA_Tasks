Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		CALL SUBFORM CONTAINER:C1086(-1)
		
	: (Form event code:C388=On Double Clicked:K2:5)
		If (Form:C1466.currItem#Null:C1517)
			C_OBJECT:C1216($form_o)
			C_LONGINT:C283($win_l)
			
			$form_o:=New object:C1471
			$form_o.ent:=Form:C1466.currItem
			$form_o.isNewWindow:=True:C214
			
			$win_l:=Open form window:C675("taskInput")
			DIALOG:C40("taskInput";$form_o)
			CLOSE WINDOW:C154($win_l)
			
			  // OK means delete or save
			If (OK=1)
				CALL SUBFORM CONTAINER:C1086(-2)
			Else 
				startDate_d:=!00-00-00!
				dueDate_d:=!00-00-00!
			End if 
		End if 
		
End case 