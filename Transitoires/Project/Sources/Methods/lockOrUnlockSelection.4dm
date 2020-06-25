//%attributes = {}
  // lockOrUnlockSelection ( {$lock} ) 
  //
  // $lock (boolean) (optionnal) : lock/unlock (to use with the menu option)
  //
  // Lock or unlock invoice selection (autoSave)

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 07.02.20, 14:04:21
	  // ----------------------------------------------------
	  // Method: lockOrUnlockSelection
	  // Description
	  // 
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_TEXT:C284($lockStatus)
C_BOOLEAN:C305($1;$lock)
C_OBJECT:C1216($invoice;$status)
C_BOOLEAN:C305($error)


If (Count parameters:C259=1)
	$lock:=$1
	OK:=1
Else 
	$lock:=Form:C1466.btnProtect.protect
	
	If ($lock)
		$lockStatus:="lock"
	Else 
		$lockStatus:="unlock"
	End if 
	
	If (Form:C1466.invoice_items.length>1)
		CONFIRM:C162("Do you want to "+$lockStatus+" "+String:C10(Form:C1466.invoice_items.length)+" invoices ? (auto save !)";"Yes";"No")
	Else 
		OK:=1
	End if 
End if 

If (OK=1)
	For each ($invoice;Form:C1466.invoice_items)
		$invoice.locked:=$lock
		$status:=$invoice.save()
		If (Not:C34($status.success))
			$error:=True:C214
		End if 
	End for each 
	Form:C1466.allInvoices:=Form:C1466.allInvoices  //refresh listbox and also the lock color for each lines
	
	  //don't allow a new save after the lock/unlock selection
	Form:C1466.btnSave.Enable(False:C215)
	Form:C1466.btnSave.Draw()
End if 

If ($error)
	ALERT:C41("One or more invoices not edited correctly")
End if 