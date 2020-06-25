
Form:C1466.target:=OBJECT Get name:C1087(Object current:K67:2)
Form:C1466.placeholder:=OBJECT Get placeholder:C1296(*;Form:C1466.target)
Form:C1466.formPath:="currentInvoice.invoice_ref"

$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
	: ($evt=On Data Change:K2:15)
		If (Form:C1466.currentInvoice.invoice_ref=" @")
			Form:C1466.currentInvoice.invoice_ref:=Substring:C12(Form:C1466.currentInvoice.invoice_ref;2)
		End if 
		
		Form:C1466.btnSave.Enable(True:C214)
		
End case 

AJUI_FloatingLabel_main (Form:C1466)
