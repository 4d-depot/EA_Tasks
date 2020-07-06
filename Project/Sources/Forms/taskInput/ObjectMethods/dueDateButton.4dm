Case of 
	: (Form event code:C388=On Load:K2:1)
		C_DATE:C307(dueDate_d)
		C_TEXT:C284($FormName)
		$FormName:=OBJECT Get name:C1087(Object current:K67:2)
		DatePicker SET WEEK FIRST DAY ($FormName;Sunday:K10:19)
		
	: (Form event code:C388=On Data Change:K2:15)
		If (Form:C1466.ent#Null:C1517)
			If (dueDate_d=!00-00-00!)
				dueDate_d:=Form:C1466.ent.DueDate
			Else 
				Form:C1466.ent.DueDate:=dueDate_d
			End if 
		End if 
		
End case 
