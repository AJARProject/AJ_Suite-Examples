  //Searchpicker sample code

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		C_TEXT:C284($ObjectName)
		$ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
		
		  // The exemple below shows how to set a label (ex : "name") inside the search zone
		
		SearchPicker SET HELP TEXT ($ObjectName;"Invoice ref or date")
		
		
		
	: (Form event code:C388=On Data Change:K2:15)
		reloadInvoicesSelection 
		reloadListAndInputArea 
		
End case 
