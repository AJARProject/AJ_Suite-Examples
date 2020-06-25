//%attributes = {"shared":true}
  // refreshInvoice ( ) 
  //
  //
  // Callback for refresh the invoice

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 11:29:48
	  // ----------------------------------------------------
	  // Method: refreshInvoice
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

If (Form:C1466.currentInvoice.UUID="")
	newInvoice 
Else 
	
	C_LONGINT:C283($row;$column)
	
	LISTBOX GET CELL POSITION:C971(*;"Invoice_lb";$column;$row)
	If ($row>0)
		Form:C1466.currentInvoice.UUID:=Form:C1466.invoice_item.UUID
		Form:C1466.currentInvoice.invoice_ref:=Form:C1466.invoice_item.invoice_ref
		Form:C1466.currentInvoice.start:=Form:C1466.invoice_item.start
		Form:C1466.currentInvoice.oldStart:=Form:C1466.invoice_item.start
		Form:C1466.currentInvoice.end:=Form:C1466.invoice_item.end
		Form:C1466.currentInvoice.oldEnd:=Form:C1466.invoice_item.end
		Form:C1466.currentInvoice.invoice_date:=Form:C1466.invoice_item.invoice_date
		Form:C1466.currentInvoice.amount_invoiced:=Form:C1466.invoice_item.amount_invoiced
		Form:C1466.currentInvoice.amount_payed:=Form:C1466.invoice_item.amount_payed
		Form:C1466.currentInvoice.rate:=Form:C1466.invoice_item.rate
		
		  //type
		Form:C1466.currentInvoice.type:=Form:C1466.invoice_item.type
		Form:C1466.bc1.SetCurrentSection(Form:C1466.invoice_item.type)
		Form:C1466.bc1.Draw()
		
		  //currency
		Form:C1466.currentInvoice.currency:=Form:C1466.invoice_item.currency
		Form:C1466.bc4.SetCurrentSection(Form:C1466.invoice_item.currency)
		Form:C1466.bc4.Draw()
		
		Form:C1466.btnSave.Enable(False:C215)
	End if 
End if 