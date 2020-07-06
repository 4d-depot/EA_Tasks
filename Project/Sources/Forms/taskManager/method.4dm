Case of 
	: (Form event code:C388=On Load:K2:1)
		  // process variables for managing row highlight after create/edit/delete
		C_TEXT:C284(taskAction_t)
		C_OBJECT:C1216(lastModifiedTask_e)
		
		  // init categories_SF
		loadCategories 
		Form:C1466.categories.selected:=Form:C1466.categories.data[0]
		Form:C1466.categories.pos:=1
		
		EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";1)
		
		  // init tasks_SF
		loadTasks ("On All Groups")
		EXECUTE METHOD IN SUBFORM:C1085("tasks_SF";"highlightRow";*;"tasks_LB";1)
		
		  // init task_SF
		loadTaskInput ("On Init")
		
		  // init searchType
		Form:C1466.searchType:=1
		Form:C1466.searchText:=""
		
		  // init mode to show task details
		Form:C1466.taskListDetailMode:=True:C214
		
	: (Form event code:C388=On Resize:K2:27)
		If (Form:C1466.taskListDetailMode)
			C_LONGINT:C283($l;$t;$r;$b)
			C_LONGINT:C283($l1;$t1;$r1;$b1)
			C_LONGINT:C283($l2;$t2;$r2;$b2)
			C_LONGINT:C283($l3;$t3;$r3;$b3)
			
			OBJECT GET COORDINATES:C663(*;"tasks_SF";$l;$t;$r;$b)
			OBJECT GET COORDINATES:C663(*;"searchRect";$l1;$t1;$r1;$b1)
			OBJECT GET COORDINATES:C663(*;"searchDropdown";$l2;$t2;$r2;$b2)
			OBJECT GET COORDINATES:C663(*;"arrowDown";$l3;$t3;$r3;$b3)
			
			OBJECT SET COORDINATES:C1248(*;"tasks_SF";$l;$t;$l+337;$b)
			OBJECT SET COORDINATES:C1248(*;"searchRect";$l1;$t1;$l1+337;$b1)
			OBJECT SET COORDINATES:C1248(*;"searchDropdown";550;$t2;570;$b2)
			OBJECT SET COORDINATES:C1248(*;"arrowDown";555;$t3;565;$b3)
			OBJECT SET COORDINATES:C1248(*;"searchText";280;59;535;76)
		End if 
		
End case 