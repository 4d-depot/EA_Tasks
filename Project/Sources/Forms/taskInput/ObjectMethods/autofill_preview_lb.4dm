Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Form:C1466.category:=Form:C1466.selectedCategory.Name
		OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)
		GOTO OBJECT:C206(*;"categoryField")
		
End case 