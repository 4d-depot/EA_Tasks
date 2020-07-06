Case of 
	: (Form event code:C388=-1)  // On Selection Change
		loadTaskInput ("On Task Change")
		
	: (Form event code:C388=-2)  // On Saving Task (New window input form)
		loadTaskManagerController (taskAction_t)
		
End case 