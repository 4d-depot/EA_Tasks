Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)
		
	: (Form event code:C388=On Data Change:K2:15)
		startDate_d:=Form:C1466.ent.StartDate
		
End case 