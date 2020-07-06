Form:C1466.searchType:=Pop up menu:C542("All;Incomplete;Completed")

Case of 
	: (Form:C1466.searchType=1)
		OBJECT SET PLACEHOLDER:C1295(*;"searchText";"All tasks")
		Form:C1466.queryPercent:=""
		
	: (Form:C1466.searchType=2)
		OBJECT SET PLACEHOLDER:C1295(*;"searchText";"Incomplete tasks")
		Form:C1466.queryPercent:=" and Percent < 100"
		
	: (Form:C1466.searchType=3)
		OBJECT SET PLACEHOLDER:C1295(*;"searchText";"Completed tasks")
		Form:C1466.queryPercent:=" and Percent = 100"
		
End case 

  // Query tasks upon changing searchType
loadTasks ("On Update")