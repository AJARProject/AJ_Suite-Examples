//%attributes = {"shared":true}
  // setType ( $params  ) 
  //
  // $params : (object) type (breadcrumb params)
  //
  // set type callback

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 10:56:40
	  // ----------------------------------------------------
	  // Method: setType
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1)

Form:C1466.currentInvoice.type:=$1.type
Form:C1466.btnSave.Enable(True:C214)