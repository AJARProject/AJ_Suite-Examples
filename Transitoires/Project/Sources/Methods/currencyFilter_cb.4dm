//%attributes = {"shared":true}
  // currencyFilter_cb ( $params  ) 
  //
  // $params : (object) currency (breadcrumb params)
  //
  // currency filter callback

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 09:07:43
	  // ----------------------------------------------------
	  // Method: currencyFilter_cb
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_OBJECT:C1216($1)

Form:C1466.currencyFilter:=$1.currency
reloadInvoicesSelection 
reloadListAndInputArea 
