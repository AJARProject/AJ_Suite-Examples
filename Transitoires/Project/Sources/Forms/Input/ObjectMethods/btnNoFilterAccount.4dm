
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_refresh"+Folder separator:K24:12
		
		Form:C1466.btnNoFilterAccount:=New AJUI_Button ($btn)
		Form:C1466.btnNoFilterAccount.Name("btnNoFilterAccount")
		Form:C1466.btnNoFilterAccount.OnClick("typeFilter_cb";New object:C1471("type";""))
		
		Form:C1466.tipNoFilterAccount:=tip_templatesButtons ("btnNoFilterAccount";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnNoFilterAccount"))
			Form:C1466.tipNoFilterAccount.TextLabel("No Credit Debit Filters ")
			Form:C1466.tipNoFilterAccount.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipNoFilterAccount.Hide()
		
	: (Form event code:C388=On Clicked:K2:4)
		Form:C1466.bc2.RemoveCurrent()
		Form:C1466.bc2.Draw()
End case 

Form:C1466.btnNoFilterAccount.Draw()