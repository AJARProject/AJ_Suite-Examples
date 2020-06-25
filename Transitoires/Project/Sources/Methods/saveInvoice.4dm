//%attributes = {"shared":true}
  // saveInvoice (  ) 
  //
  //
  // Callback save current invoice 

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 11:44:35
	  // ----------------------------------------------------
	  // Method: saveInvoice
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

If (Not:C34(Macintosh option down:C545))
	CONFIRM:C162("Do you want to Save the invoice : "+Form:C1466.currentInvoice.invoice_ref;"YES";"NO")
End if 

If (Form:C1466.currentInvoice.UUID#"")  // update invoice
	If (Form:C1466.currentInvoice.UUID=Form:C1466.invoice_item.UUID)
		If (OK=1)
			C_OBJECT:C1216($status)
			Form:C1466.invoice_item.invoice_ref:=Form:C1466.currentInvoice.invoice_ref
			Form:C1466.invoice_item.start:=Form:C1466.currentInvoice.start
			Form:C1466.invoice_item.end:=Form:C1466.currentInvoice.end
			Form:C1466.invoice_item.invoice_date:=Form:C1466.currentInvoice.invoice_date
			Form:C1466.invoice_item.amount_invoiced:=Form:C1466.currentInvoice.amount_invoiced
			Form:C1466.invoice_item.amount_payed:=Form:C1466.currentInvoice.amount_payed
			Form:C1466.invoice_item.type:=Form:C1466.currentInvoice.type
			Form:C1466.invoice_item.rate:=Form:C1466.currentInvoice.rate
			Form:C1466.invoice_item.currency:=Form:C1466.currentInvoice.currency
			Form:C1466.invoice_item.locked:=Form:C1466.btnProtect.protect
			$status:=Form:C1466.invoice_item.save()
			
			If ($status.success)
				checkYear (Year of:C25(Form:C1466.invoice_item.invoice_date);False:C215)
				Form:C1466.btnSave.Enable(False:C215)
			Else 
				ALERT:C41("Error, Invoice can't be edited")
			End if 
			
		End if 
	Else 
		ALERT:C41("Unknow UUID")
	End if 
Else 
	If (OK=1)  // New invoice
		C_OBJECT:C1216($invoiceNew)
		C_LONGINT:C283($pos)
		C_COLLECTION:C1488($invoices)
		
		$invoiceNew:=ds:C1482.invoice.new()
		$invoiceNew.invoice_ref:=Form:C1466.currentInvoice.invoice_ref
		$invoiceNew.start:=Form:C1466.currentInvoice.start
		$invoiceNew.end:=Form:C1466.currentInvoice.end
		$invoiceNew.invoice_date:=Form:C1466.currentInvoice.invoice_date
		$invoiceNew.amount_invoiced:=Form:C1466.currentInvoice.amount_invoiced
		$invoiceNew.amount_payed:=Form:C1466.currentInvoice.amount_payed
		$invoiceNew.type:=Form:C1466.currentInvoice.type
		$invoiceNew.rate:=Form:C1466.currentInvoice.rate
		$invoiceNew.currency:=Form:C1466.currentInvoice.currency
		$invoiceNew.locked:=Form:C1466.btnProtect.protect
		$invoiceNew.save()
		
		checkYear (Year of:C25(Form:C1466.currentInvoice.invoice_date);True:C214)
		
		  //select the new invoice 
		$invoices:=Form:C1466.allInvoices.toCollection()
		$pos:=$invoices.extract("UUID").indexOf($invoiceNew.UUID)
		If ($pos<0)
			$pos:=0
		End if 
		Form:C1466.currentInvoice.UUID:=$invoiceNew.UUID
		LISTBOX SELECT ROW:C912(*;"Invoice_lb";$pos+1)
		OBJECT SET SCROLL POSITION:C906(*;"Invoice_lb")
		Form:C1466.invoice_item:=Form:C1466.allInvoices[$pos]
		Form:C1466.btnSave.Enable(False:C215)
	End if 
End if 
