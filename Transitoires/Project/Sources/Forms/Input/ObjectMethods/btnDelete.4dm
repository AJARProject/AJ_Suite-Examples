
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_delete"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_delete"+Folder separator:K24:12
		
		Form:C1466.btnDelete:=New AJUI_Button ($btn)
		Form:C1466.btnDelete.Name("btnDelete")
		Form:C1466.btnDelete.OnClick("deleteInvoice")
		
		Form:C1466.tipDelete:=tip_templatesButtons ("btnDelete";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnDelete"))
			Form:C1466.tipDelete.TextLabel("Delete the invoice line")
			Form:C1466.tipDelete.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipDelete.Hide()
		
End case 

Form:C1466.btnDelete.Draw()