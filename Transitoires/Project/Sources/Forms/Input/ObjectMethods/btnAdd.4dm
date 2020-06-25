
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_add"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_add"+Folder separator:K24:12
		
		Form:C1466.btnAdd:=New AJUI_Button ($btn)
		Form:C1466.btnAdd.Name("btnAdd")
		Form:C1466.btnAdd.OnClick("newInvoice")
		Form:C1466.tipAdd:=tip_templatesButtons ("btnAdd";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnAdd"))
			Form:C1466.tipAdd.TextLabel("Add a new line")
			Form:C1466.tipAdd.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipAdd.Hide()
		
	: (Form event code:C388=On Clicked:K2:4) & (Macintosh option down:C545)
		GOTO OBJECT:C206(*;"amount_invoiced_value")
		
	: (Form event code:C388=On Clicked:K2:4)
		GOTO OBJECT:C206(*;"invoice_ref_value")
		
End case 

Form:C1466.btnAdd.Draw()