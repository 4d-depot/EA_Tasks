//%attributes = {"invisible":true}
C_TEXT:C284($1;$action_t)
$action_t:=$1

Case of 
	: ($action_t="On All Groups")
		Form:C1466.tasks.data:=ds:C1482.Task.all().orderBy("DueDate desc")
		
	: ($action_t="On Update")
		C_TEXT:C284($queryPercent_t;$queryCategory_t;$searchText_t)
		C_LONGINT:C283($categoryID_l)
		
		$categoryID_l:=Form:C1466.categories.selected.ID
		$searchText_t:=Form:C1466.searchText+"@"
		$queryPercent_t:=Form:C1466.queryPercent
		
		If ($categoryID_l=0)
			$queryCategory_t:=" and CategoryID >= :2"
		Else 
			$queryCategory_t:=" and CategoryID = :2"
		End if 
		
		Form:C1466.tasks.data:=ds:C1482.Task.query("Title = :1"+$queryCategory_t+$queryPercent_t;$searchText_t;$categoryID_l)\
			.orderBy("DueDate desc, Title desc")
		
End case 

C_LONGINT:C283($numRecords_l)
C_TEXT:C284($plural_t)
$numRecords_l:=Form:C1466.tasks.data.length

$plural_t:=Choose:C955($numRecords_l=1;"";"s")
Form:C1466.tasks.result:=String:C10($numRecords_l)+" task"+$plural_t+" found"