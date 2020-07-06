C_OBJECT:C1216($form_o)
$form_o:=New object:C1471
$form_o.ent:=New object:C1471
$form_o.isNewWindow:=True:C214

taskAction_t:=""

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("taskInput")
DIALOG:C40("taskInput";$form_o)
CLOSE WINDOW:C154($win_l)

loadTaskManagerController (taskAction_t)