//%attributes = {"invisible":true}
C_TEXT:C284($0;$color_t;$fontsize_t;$sp)
C_LONGINT:C283($status_l)
$status_l:=This:C1470.Status
$sp:="_"

If (This:C1470.Percent=0)
	$0:="<span>"+(Char:C90(Space:K15:42)*5)+"</span><span style=\"color:#FF8000; background-color:#FFFFFF;\">  "\
		+Choose:C955($status_l;"";"Not Started";"In Progress";"Completed")+"  </span>"
Else 
	If (This:C1470.Percent=100)
		$color_t:="#00AEEF"
	Else 
		$color_t:="#FF8000"
	End if 
	
	If (Folder separator:K24:12=":")
		$fontsize_t:="12px;"
	Else 
		$fontsize_t:="10px;"
	End if 
	
	$0:="<span>"+(Char:C90(Space:K15:42)*5)+"</span><span style=\"font-size: "+$fontsize_t+"; background-color:"\
		+$color_t+"; color:"+$color_t+";\">"+(($sp)*This:C1470.Percent)\
		+"</span><span style=\"color:#666666; background-color:#FFFFFF;\"> "\
		+String:C10(This:C1470.Percent)+"% </span>"
End if 