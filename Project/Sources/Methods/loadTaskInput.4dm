//%attributes = {"invisible":true}
C_TEXT:C284($1;$action_t)
$action_t:=$1

Case of 
	: ($action_t="On Init") | ($action_t="On Category Change")
		Form:C1466.task.ent:=Form:C1466.tasks.data.first()
		
	: ($action_t="On Task Change")
		Form:C1466.task.ent:=Form:C1466.tasks.currItem
		
	: ($action_t="On Edit")
		Form:C1466.task.ent:=lastModifiedTask_e
		
End case 

If (Form:C1466.task.ent=Null:C1517)
	Form:C1466.task.category:=""
	Form:C1466.task.noPriority:=0
	Form:C1466.task.lowPriority:=0
	Form:C1466.task.highPriority:=0
	Form:C1466.task.progressBar:=0
	Form:C1466.task.status:=""
	EXECUTE METHOD IN SUBFORM:C1085("task_SF";"toggleTaskInput";*;False:C215)
	
Else 
	EXECUTE METHOD IN SUBFORM:C1085("task_SF";"toggleTaskInput";*;True:C214)
	Form:C1466.task.progressBar:=Form:C1466.task.ent.Percent
	
	Case of 
		: (Form:C1466.task.ent.Status=1)
			Form:C1466.task.status:="Not Started"
			
		: (Form:C1466.task.ent.Status=2)
			Form:C1466.task.status:="In Progress"
			
		: (Form:C1466.task.ent.Status=3)
			Form:C1466.task.status:="Completed"
			
	End case 
	
	
	Case of 
		: (Form:C1466.task.ent.Priority=0)
			Form:C1466.task.noPriority:=1
			Form:C1466.task.lowPriority:=0
			Form:C1466.task.highPriority:=0
			
		: (Form:C1466.task.ent.Priority=1)
			Form:C1466.task.noPriority:=0
			Form:C1466.task.lowPriority:=1
			Form:C1466.task.highPriority:=0
			
		: (Form:C1466.task.ent.Priority=2)
			Form:C1466.task.noPriority:=0
			Form:C1466.task.lowPriority:=0
			Form:C1466.task.highPriority:=1
			
	End case 
	
	
	If (Form:C1466.task.ent.category=Null:C1517)
		Form:C1466.task.category:=""
	Else 
		Form:C1466.task.category:=Form:C1466.task.ent.category.Name
	End if 
	
End if 