
Form:C1466.target:=OBJECT Get name:C1087(Object current:K67:2)
Form:C1466.placeholder:=OBJECT Get placeholder:C1296(*;Form:C1466.target)
Form:C1466.formPath:="currentInvoice.start"

$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
	: ($evt=On Data Change:K2:15)
		
		If (Form:C1466.currentInvoice.start>Form:C1466.currentInvoice.end)
			Form:C1466.currentInvoice.start:=Form:C1466.currentInvoice.oldStart
			BEEP:C151
			ALERT:C41("Start date must be lower than end date")
		Else 
			Form:C1466.btnSave.Enable(True:C214)
			Form:C1466.currentInvoice.oldStart:=Form:C1466.currentInvoice.start
		End if 
		
End case 

AJUI_FloatingLabel_main (Form:C1466)
