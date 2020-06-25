//%attributes = {"shared":true}
  // newInvoice (  ) 
  //
  //
  // Create new invoice with default parameters

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.20, 12:06:01
	  // ----------------------------------------------------
	  // Method: newInvoice
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Not:C34(Macintosh option down:C545))
	Form:C1466.currentInvoice:=New object:C1471
	Form:C1466.currentInvoice.UUID:=""
	Form:C1466.currentInvoice.invoice_ref:=" "
	Form:C1466.currentInvoice.start:=Current date:C33
	Form:C1466.currentInvoice.oldStart:=Current date:C33
	Form:C1466.currentInvoice.end:=Current date:C33+365
	Form:C1466.currentInvoice.oldEnd:=Current date:C33
	Form:C1466.currentInvoice.invoice_date:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33)))
	Form:C1466.currentInvoice.rate:=0
Else 
	Form:C1466.currentInvoice.UUID:=""
End if 

Form:C1466.btnProtect.protect:=False:C215

Lock_invoice_item 

Form:C1466.currentInvoice.amount_invoiced:=0
Form:C1466.currentInvoice.amount_payed:=0


  //type
If (Not:C34(Macintosh option down:C545))
	Form:C1466.currentInvoice.type:="debit"
	Form:C1466.bc1.SetCurrentSection("debit")
Else 
	
End if 
Form:C1466.bc1.Draw()

  //currency
If (Not:C34(Macintosh option down:C545))
	Form:C1466.currentInvoice.currency:="Frs"
	Form:C1466.bc4.SetCurrentSection("Frs")
	
Else 
	
End if 
Form:C1466.bc4.Draw()

Form:C1466.btnSave.Enable(False:C215)



