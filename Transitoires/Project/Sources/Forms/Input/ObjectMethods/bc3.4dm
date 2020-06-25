$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		C_OBJECT:C1216($bc;$section_obj;$params)
		$bc:=New object:C1471()
		$bc.templateName:="Currencies"
		$bc.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"Currencies"+Folder separator:K24:12
		
		Form:C1466.bc3:=New AJUI_BreadCrumb ($bc)
		Form:C1466.bc3.Name("bc3")
		Form:C1466.bc3.SetCurrentSection("Frs")
		
		  //add callback
		$section_obj:=New object:C1471
		$section_obj.onClickCB:="currencyFilter_cb"
		
		  //Frs
		$params:=New object:C1471
		$params.currency:="Frs"
		$section_obj.onClickCBParams:=OB Copy:C1225($params)
		Form:C1466.bc3.UpdateSection("Frs";$section_obj)
		
		  //€
		$params.currency:="€"
		$section_obj.onClickCBParams:=OB Copy:C1225($params)
		Form:C1466.bc3.UpdateSection("€";$section_obj)
		
		  //$
		$params.currency:="$"
		$section_obj.onClickCBParams:=OB Copy:C1225($params)
		Form:C1466.bc3.UpdateSection("$";$section_obj)
		
		
End case 

Form:C1466.bc3.Draw()