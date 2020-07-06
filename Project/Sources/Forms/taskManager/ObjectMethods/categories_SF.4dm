Case of 
	: (Form event code:C388=-1)  // On Selection Change
		loadTasks ("On Update")
		EXECUTE METHOD IN SUBFORM:C1085("tasks_SF";"highlightRow";*;"tasks_LB";1)
		
		loadTaskInput ("On Category Change")
		
End case 