//%attributes = {}
  // reloadListAndInputArea ()
  //
  // Reload the listbox and the input area. Select first element if exist, if not create a new invoice

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 29.01.20, 14:00:42
	  // ----------------------------------------------------
	  // Method: reloadListAndInputArea
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Form:C1466.allInvoices.length>0)
	
	LISTBOX SELECT ROW:C912(*;"Invoice_lb";1)
	Form:C1466.invoice_item:=Form:C1466.allInvoices.first()
	
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
	Form:C1466.btnProtect.protect:=Form:C1466.invoice_item.locked
	
	Lock_invoice_item 
	
	  //type
	Form:C1466.currentInvoice.type:=Form:C1466.invoice_item.type
	Form:C1466.bc1.SetCurrentSection(Form:C1466.invoice_item.type)
	Form:C1466.bc1.Draw()
	
	  //currency
	Form:C1466.currentInvoice.currency:=Form:C1466.invoice_item.currency
	Form:C1466.bc4.SetCurrentSection(Form:C1466.invoice_item.currency)
	Form:C1466.bc4.Draw()
	Form:C1466.btnSave.Enable(False:C215)
	
Else 
	newInvoice 
End if 