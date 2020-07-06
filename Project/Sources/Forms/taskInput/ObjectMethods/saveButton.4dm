C_OBJECT:C1216($foundCategory_es;$newCategory_e;$status_o)
C_TEXT:C284($errors_t)

  // hide category autocomplete box when save button is clicked
OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)

If (Form:C1466.ent=Null:C1517)
	ALERT:C41("Please select a task to delete")
Else 
	
	  // Set correct priority value to entity
	  // 0 - None
	  // 1 - Low
	  // 2 - High
	Case of 
		: (Form:C1466.noPriority=1)
			Form:C1466.ent.Priority:=0
			
		: (Form:C1466.lowPriority=1)
			Form:C1466.ent.Priority:=1
			
		: (Form:C1466.highPriority=1)
			Form:C1466.ent.Priority:=2
	End case 
	
	  // Check whether user entered existing or new category
	$foundCategory_es:=ds:C1482.Category.query("Name = :1";Form:C1466.category)
	
	If ($foundCategory_es.length=1)  // when users enters existing category
		Form:C1466.ent.category:=$foundCategory_es.first()
		
	Else   // when user enters a new category
		If (Form:C1466.category#"")
			$newCategory_e:=ds:C1482.Category.new()
			$newCategory_e.Name:=Form:C1466.category
			$status_o:=$newCategory_e.save()
			
			If (Not:C34($status_o.success))
				ALERT:C41("Failed to save category entity: "+$status_o.statusText)
			Else 
				Form:C1466.ent.category:=$newCategory_e
			End if 
		Else 
			Form:C1466.ent.category:=Null:C1517
		End if 
	End if 
	
	  // validate fields
	$errors_t:=validateTaskFields (Form:C1466.ent)
	If (Length:C16($errors_t)>0)
		ALERT:C41($errors_t)
	Else 
		$status_o:=Form:C1466.ent.save()
		
		If (Not:C34($status_o.success))
			ALERT:C41("Failed to save task entity: "+$status_o.statusText)
		Else 
			lastModifiedTask_e:=Form:C1466.ent
			If (Form:C1466.isNewWindow=False:C215)
				CALL SUBFORM CONTAINER:C1086(-1)
			Else 
				taskAction_t:="On Saving Task"
			End if 
		End if 
	End if 
	
	If (Form:C1466.isNewWindow=True:C214 & (Length:C16($errors_t)=0))
		ACCEPT:C269
	End if 
End if 

