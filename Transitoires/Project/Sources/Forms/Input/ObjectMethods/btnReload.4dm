
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_refresh"+Folder separator:K24:12
		
		Form:C1466.btnReload:=New AJUI_Button ($btn)
		Form:C1466.btnReload.Name("btnReload")
		Form:C1466.btnReload.OnClick("refreshInvoice")
		
		Form:C1466.tipReload:=tip_templatesButtons ("btnReload";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnReload"))
			Form:C1466.tipReload.TextLabel("Reload the invoice line")
			Form:C1466.tipReload.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipReload.Hide()
		
End case 

Form:C1466.btnReload.Draw()