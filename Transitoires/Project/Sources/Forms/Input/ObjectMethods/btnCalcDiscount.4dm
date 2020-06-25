
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_refresh"+Folder separator:K24:12
		
		Form:C1466.btnCalcDiscount:=New AJUI_Button ($btn)
		Form:C1466.btnCalcDiscount.Name("btnCalcDiscount")
		Form:C1466.btnCalcDiscount.OnClick("calcDiscount")
		
		Form:C1466.tipCalcDiscount:=tip_templatesButtons ("btnCalcDiscount";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnCalcDiscount"))
			Form:C1466.tipCalcDiscount.TextLabel("Calc Discount")
			Form:C1466.tipCalcDiscount.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipCalcDiscount.Hide()
		
End case 

Form:C1466.btnCalcDiscount.Draw()