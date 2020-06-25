//%attributes = {"shared":true}
  // deleteInvoice (  ) 
  //
  //
  // Callback delete selected invoice

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 11:44:13
	  // ----------------------------------------------------
	  // Method: deleteInvoice
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

If (Form:C1466.currentInvoice.UUID#"")
	If (Form:C1466.currentInvoice.UUID=Form:C1466.invoice_item.UUID)
		If (Not:C34(Macintosh option down:C545))
			CONFIRM:C162("Do you want to delete the invoice : "+Form:C1466.invoice_item.invoice_ref;"YES";"NO")
		End if 
		If (OK=1)
			C_OBJECT:C1216($status)
			$status:=Form:C1466.invoice_item.drop()
			If ($status.success)
				ALERT:C41("Invoice deleted")
				reloadInvoicesSelection 
				reloadListAndInputArea 
			Else 
				ALERT:C41(("Can't delete invoice"))
			End if 
		End if 
	End if 
Else 
	ALERT:C41("Select an invoice")
End if 
