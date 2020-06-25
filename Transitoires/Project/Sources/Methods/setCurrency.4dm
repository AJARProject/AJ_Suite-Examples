//%attributes = {"shared":true}
  // setCurrency ( $params  ) 
  //
  // $params : (object) currency (breadcrumb params)
  //
  // set currency callback

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 10:56:29
	  // ----------------------------------------------------
	  // Method: setCurrency
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1)

Form:C1466.currentInvoice.currency:=$1.currency
Form:C1466.btnSave.Enable(True:C214)