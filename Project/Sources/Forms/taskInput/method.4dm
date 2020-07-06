Case of 
	: (Form event code:C388=On Load:K2:1)
		Case of 
			: (Form:C1466.ent=Null:C1517)
				EXECUTE METHOD IN SUBFORM:C1085("task_SF";"toggleTaskInput";*;False:C215)
				
			: (OB Is empty:C1297(Form:C1466.ent)=True:C214)  // creating a new task
				OBJECT SET ENABLED:C1123(*;"delButton";False:C215)
				
				  // create a new Task entity
				Form:C1466.ent:=ds:C1482.Task.new()
				startDate_d:=Current date:C33
				dueDate_d:=Current date:C33
				Form:C1466.ent.StartDate:=startDate_d
				Form:C1466.ent.DueDate:=dueDate_d
				
				  // Set default category to empty string
				Form:C1466.category:=""
				
				  // Set default values for priority upon new task creation
				Form:C1466.noPriority:=1  // default to "None" priority on radio button
				Form:C1466.lowPriority:=0
				Form:C1466.highPriority:=0
				
				  // Set default Status to "Incomplete"
				Form:C1466.status:="Incomplete"
				Form:C1466.ent.Status:=1
				
				
			Else   // editing a current task
				startDate_d:=Form:C1466.ent.StartDate
				dueDate_d:=Form:C1466.ent.DueDate
				EXECUTE METHOD IN SUBFORM:C1085("task_SF";"toggleTaskInput";*;True:C214)
				Case of 
					: (Form:C1466.ent.Status=1)
						Form:C1466.status:="Not Started"
						
					: (Form:C1466.ent.Status=2)
						Form:C1466.status:="In Progress"
						
					: (Form:C1466.ent.Status=3)
						Form:C1466.status:="Completed"
						
				End case 
				
				Case of 
					: (Form:C1466.ent.Priority=0)
						Form:C1466.noPriority:=1
						Form:C1466.lowPriority:=0
						Form:C1466.highPriority:=0
						
					: (Form:C1466.ent.Priority=1)
						Form:C1466.noPriority:=0
						Form:C1466.lowPriority:=1
						Form:C1466.highPriority:=0
						
					: (Form:C1466.ent.Priority=2)
						Form:C1466.noPriority:=0
						Form:C1466.lowPriority:=0
						Form:C1466.highPriority:=1
						
				End case 
				
				If (Form:C1466.ent.category=Null:C1517)
					Form:C1466.category:=""
				Else 
					Form:C1466.category:=Form:C1466.ent.category.Name
				End if 
				
		End case 
End case 