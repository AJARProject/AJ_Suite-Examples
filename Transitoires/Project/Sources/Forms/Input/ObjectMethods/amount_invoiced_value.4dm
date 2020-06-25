
Form:C1466.target:=OBJECT Get name:C1087(Object current:K67:2)
Form:C1466.placeholder:=OBJECT Get placeholder:C1296(*;Form:C1466.target)
Form:C1466.formPath:="currentInvoice.amount_invoiced"

$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
	: ($evt=On Data Change:K2:15)
		Form:C1466.btnSave.Enable(True:C214)
		
		Case of 
			: (Form:C1466.currentInvoice.currency#"Frs") & (Form:C1466.currentInvoice.type="debit")  //calc rate
				Form:C1466.currentInvoice.rate:=Form:C1466.currentInvoice.amount_payed/Form:C1466.currentInvoice.amount_invoiced
				
			: (Form:C1466.currentInvoice.currency#"Frs") & (Form:C1466.currentInvoice.type="credit")  //calc amount payed
				Form:C1466.currentInvoice.amount_payed:=Form:C1466.currentInvoice.rate*Form:C1466.currentInvoice.amount_invoiced
				
			: (Form:C1466.currentInvoice.currency="Frs") & (Form:C1466.currentInvoice.type="debit")
				  //nothing to do
			: (Form:C1466.currentInvoice.currency="Frs") & (Form:C1466.currentInvoice.type="credit")
				  //nothing to do
		End case 
		
End case 

AJUI_FloatingLabel_main (Form:C1466)
