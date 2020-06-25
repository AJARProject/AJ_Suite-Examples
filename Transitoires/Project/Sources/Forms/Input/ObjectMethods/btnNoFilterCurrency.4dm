
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_refresh"+Folder separator:K24:12
		
		Form:C1466.btnNoFilterCurrency:=New AJUI_Button ($btn)
		Form:C1466.btnNoFilterCurrency.Name("btnNoFilterCurrency")
		Form:C1466.btnNoFilterCurrency.OnClick("currencyFilter_cb";New object:C1471("currency";""))
		
		Form:C1466.tipNoFilterCurrency:=tip_templatesButtons ("btnNoFilterCurrency";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnNoFilterCurrency"))
			Form:C1466.tipNoFilterCurrency.TextLabel("No currency filters")
			Form:C1466.tipNoFilterCurrency.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipNoFilterCurrency.Hide()
		
	: (Form event code:C388=On Clicked:K2:4)
		Form:C1466.bc3.RemoveCurrent()
		Form:C1466.bc3.Draw()
		
End case 

Form:C1466.btnNoFilterCurrency.Draw()