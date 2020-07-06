Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.currItem#Null:C1517)
			Form:C1466.selected:=Form:C1466.currItem
			Form:C1466.pos:=Form:C1466.currPos
			CALL SUBFORM CONTAINER:C1086(-1)
		Else 
			LISTBOX SELECT ROW:C912(*;"categories_LB";Form:C1466.pos)
		End if 
		
End case 