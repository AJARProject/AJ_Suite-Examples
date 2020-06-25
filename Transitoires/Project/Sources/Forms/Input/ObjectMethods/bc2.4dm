$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		C_OBJECT:C1216($bc;$section_obj;$params)
		$bc:=New object:C1471()
		$bc.templateName:="Debit-Credit"
		$bc.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"Debit-Credit"+Folder separator:K24:12
		
		Form:C1466.bc2:=New AJUI_BreadCrumb ($bc)
		Form:C1466.bc2.Name("bc2")
		Form:C1466.bc2.SetCurrentSection("debit")
		
		
		  //add callback
		$section_obj:=New object:C1471
		$section_obj.onClickCB:="typeFilter_cb"
		
		  //debit
		$params:=New object:C1471
		$params.type:="debit"
		$section_obj.onClickCBParams:=OB Copy:C1225($params)
		Form:C1466.bc2.UpdateSection("debit";$section_obj)
		
		  //credit
		$params.type:="credit"
		$section_obj.onClickCBParams:=OB Copy:C1225($params)
		Form:C1466.bc2.UpdateSection("credit";$section_obj)
		
		
End case 

Form:C1466.bc2.Draw()