//%attributes = {}
  // deleteSelection (  ) 
  //
  //
  // delete invoices selection

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.06.20, 11:32:11
	  // ----------------------------------------------------
	  // Method: deleteSelection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

If (Form:C1466.invoice_items.length>=1)
	
	CONFIRM:C162("Do you want to delete the selection ?";"Yes";"No")
	
	If (OK=1)
		
		$notDropped:=Form:C1466.invoice_items.drop()
		
		reloadInvoicesSelection 
		reloadListAndInputArea 
	End if 
End if 

If ($notDropped.length=0)
	  //success
Else 
	ALERT:C41(String:C10($notDropped.length)+" invoice(s) not deleted")
End if 