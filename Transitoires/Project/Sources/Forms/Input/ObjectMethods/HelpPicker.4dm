
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.tipSearchPicker:=tip_templatesButtons ("HelpPicker";"")
		Form:C1466.tipSearchPicker.TipboxMaxWidth(190)
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"HelpPicker"))
			Form:C1466.tipSearchPicker.TextLabel("Start/End : 01.01.20...05.05.20 Date : 01.01&05.05")
			Form:C1466.tipSearchPicker.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipSearchPicker.Hide()
		
End case 