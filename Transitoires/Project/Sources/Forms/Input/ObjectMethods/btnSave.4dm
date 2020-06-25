
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_edit"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_edit"+Folder separator:K24:12
		
		Form:C1466.btnSave:=New AJUI_Button ($btn)
		Form:C1466.btnSave.Name("btnSave")
		Form:C1466.btnSave.OnClick("saveInvoice")
		
		Form:C1466.tipSave:=tip_templatesButtons ("btnSave";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnSave"))
			Form:C1466.tipSave.TextLabel("Save")
			Form:C1466.tipSave.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipSave.Hide()
		
End case 

Form:C1466.btnSave.Draw()