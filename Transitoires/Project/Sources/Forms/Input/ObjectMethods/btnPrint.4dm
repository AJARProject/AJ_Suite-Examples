
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_print"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_print"+Folder separator:K24:12
		
		Form:C1466.btnPrint:=New AJUI_Button ($btn)
		Form:C1466.btnPrint.Name("btnPrint")
		Form:C1466.btnPrint.OnClick("print_selection_cb")
		Form:C1466.tipPrint:=tip_templatesButtons ("btnPrint";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnPrint"))
			Form:C1466.tipPrint.TextLabel("Print Selection")
			Form:C1466.tipPrint.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipPrint.Hide()
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		
End case 

Form:C1466.btnPrint.Draw()