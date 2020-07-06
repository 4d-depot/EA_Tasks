Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)
		
	: (Form event code:C388=On Data Change:K2:15)
		Case of 
			: (Form:C1466.status="Completed")
				Form:C1466.ent.Percent:=100
				Form:C1466.ent.Status:=3
				
			: (Form:C1466.status="Not Started")
				Form:C1466.ent.Percent:=0
				Form:C1466.ent.Status:=1
				
			: (Form:C1466.status="In Progress")
				Form:C1466.ent.Percent:=50
				Form:C1466.ent.Status:=2
				
		End case 
		
End case 