//%attributes = {"shared":true}

  // calculation of the invoice after discount
Form:C1466.currentInvoice.amount_invoiced:=Form:C1466.currentInvoice.amount_invoiced*(100-Form:C1466.discount)/100
Form:C1466.currentInvoice.amount_payed:=Form:C1466.currentInvoice.amount_payed*(100-Form:C1466.discount)/100

  // add the discount value to the invoice ref
$position:=Position:C15("-";Form:C1466.currentInvoice.invoice_ref)
If ($position>0)
	Form:C1466.currentInvoice.invoice_ref:=Substring:C12(Form:C1466.currentInvoice.invoice_ref;1;$position-2)
End if 

If (Form:C1466.discount#0)
	Form:C1466.currentInvoice.invoice_ref:=Form:C1466.currentInvoice.invoice_ref+" -"+String:C10(Form:C1466.discount)+"%"
End if 

  // reset the discount value
Form:C1466.discount:=0