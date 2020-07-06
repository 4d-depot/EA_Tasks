Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.ent#Null:C1517)
			Case of 
				: (Form:C1466.ent.Percent=100)
					Form:C1466.status:="Completed"
					Form:C1466.ent.Status:=3
					
				: (Form:C1466.ent.Percent=0)
					Form:C1466.status:="Not Started"
					Form:C1466.ent.Status:=1
					
				Else 
					Form:C1466.status:="In Progress"
					Form:C1466.ent.Status:=2
					
			End case 
		End if 
		
End case 