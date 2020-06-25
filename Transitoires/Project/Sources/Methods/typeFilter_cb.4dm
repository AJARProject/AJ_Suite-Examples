//%attributes = {"shared":true}
  // typeFilter_cb ( $params  ) 
  //
  // $params : (object) type (breadcrumb params)
  //
  // type filter callback

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 09:08:33
	  // ----------------------------------------------------
	  // Method: typeFilter_cb
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_OBJECT:C1216($1)

Form:C1466.typeFilter:=Uppercase:C13($1.type)
reloadInvoicesSelection 
reloadListAndInputArea 
