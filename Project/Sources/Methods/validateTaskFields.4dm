//%attributes = {"invisible":true}
  // Method: validateTaskFields
  // Description:
  //     Checks whether any of the Task fields are empty or invalid values
  //
  // Parameters:
  //     $0 - Error message
  //     $1 - Entity from Task table
  // ----------------------------------------------------

C_TEXT:C284($0;$errors_t)
C_OBJECT:C1216($1;$task_e)
$task_e:=$1
$errors_o:=New object:C1471

C_TEXT:C284($field_t)
C_OBJECT:C1216($errors_o)

If ($task_e.Title="")
	$errors_o.Title:="Title cannot be empty"
End if 

If ($task_e.StartDate=!00-00-00!)
	$errors_o.StartDate:="Start date is invalid"
End if 

If ($task_e.DueDate=!00-00-00!)
	$errors_o.DueDate:="Due date is invalid"
End if 

If ($task_e.DueDate-$task_e.StartDate<0)
	$errors_o.DateDif:="Start date must be prior to due date"
End if 

If ($task_e.category=Null:C1517)
	$errors_o.Category:="Category cannot be empty"
End if 

For each ($field_t;$errors_o)
	$errors_t:=$errors_t+" - "+$errors_o[$field_t]+Char:C90(Carriage return:K15:38)
End for each 

$0:=$errors_t