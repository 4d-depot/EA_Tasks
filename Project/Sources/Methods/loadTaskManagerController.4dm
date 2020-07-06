//%attributes = {"invisible":true}
C_TEXT:C284($1;$taskAction_t)
C_LONGINT:C283($categoryPos_l;$taskPos_l)

$taskAction_t:=$1

Case of 
	: ($taskAction_t="On Saving Task")
		  //  Highlight correct category after creating/modifying a task
		loadCategories 
		$categoryPos_l:=Form:C1466.categories.data.findIndex("findCategory";lastModifiedTask_e.category.Name)
		Form:C1466.categories.pos:=$categoryPos_l+1
		Form:C1466.categories.selected:=Form:C1466.categories.data[$categoryPos_l]
		EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";$categoryPos_l+1)
		
		  // Highlight correct task after creating/modifying a task
		loadTasks ("On Update")
		$taskPos_l:=Form:C1466.tasks.data.toCollection().findIndex("findTask";lastModifiedTask_e.ID)
		EXECUTE METHOD IN SUBFORM:C1085("tasks_SF";"highlightRow";*;"tasks_LB";$taskPos_l+1)
		
		  // Update task input form
		loadTaskInput ("On Edit")
		
	: ($taskAction_t="On Deleting Task")
		  // Get listbox position of entity before deletion
		$taskPos_l:=Form:C1466.tasks.data.toCollection().findIndex("findTask";lastModifiedTask_e.ID)
		lastModifiedTask_e.drop()
		
		loadCategories 
		$categoryPos_l:=Form:C1466.categories.data.findIndex("findCategory";lastModifiedTask_e.category.Name)
		
		  // If deleted item was the only item in the category, select "All Groups"
		If ($categoryPos_l=-1)
			EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";1)
			
			Form:C1466.categories.selected:=Form:C1466.categories.data[0]
			Form:C1466.categories.pos:=1
			
			loadTasks ("On Update")
			loadTaskInput ("On Init")
			EXECUTE METHOD IN SUBFORM:C1085("tasks_SF";"highlightRow";*;"tasks_LB";1)
		Else 
			EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";Form:C1466.categories.pos)
			loadTasks ("On Update")
			If ($taskPos_l=Form:C1466.tasks.data.length)
				EXECUTE METHOD IN SUBFORM:C1085("tasks_SF";"highlightRow";*;"tasks_LB";$taskPos_l)
				Form:C1466.tasks.currItem:=Form:C1466.tasks.data[$taskPos_l-1]
				loadTaskInput ("On Task Change")
			Else 
				EXECUTE METHOD IN SUBFORM:C1085("tasks_SF";"highlightRow";*;"tasks_LB";$taskPos_l+1)
				Form:C1466.tasks.currItem:=Form:C1466.tasks.data[$taskPos_l]
				loadTaskInput ("On Task Change")
			End if 
		End if 
		
		
	Else   // else if user cancels form, keep same date on taskInput subform
		startDate_d:=!00-00-00!
		dueDate_d:=!00-00-00!
		
End case 