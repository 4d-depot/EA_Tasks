//%attributes = {}
C_LONGINT:C283($1;$pid_l)

If (Count parameters:C259=0)
	$pid_l:=New process:C317(Current method name:C684;0;"Task Manager";1;*)
Else 
	C_OBJECT:C1216($form_o)
	$form_o:=New object:C1471
	$form_o.categories:=New object:C1471
	$form_o.tasks:=New object:C1471
	$form_o.task:=New object:C1471
	$form_o.task.isNewWindow:=False:C215
	
	C_LONGINT:C283($win_l)
	$win_l:=Open form window:C675("taskManager")
	DIALOG:C40("taskManager";$form_o)
	CLOSE WINDOW:C154($win_l)
End if 