//%attributes = {}
  // checkYear ( $year ; $newInvoice  ) 
  //
  // $year : (longint) value of invoice_date
  // $newInvoice : (text)  new invoice ?
  //
  // control the year

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 14:44:18
	  // ----------------------------------------------------
	  // Method: checkYear
	  // Description
	  // If filter year =  invoice date year, only new invoice is reloaded
	  // else
	  // Add year in the filter list if not exist
	  // Select the year corresponding to the invoice date year value
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$year)
C_BOOLEAN:C305($2;$newInvoice)
C_POINTER:C301($years_list_ptr)

$year:=$1
$newInvoice:=$2

If (Form:C1466.year=$year)
	If ($newInvoice)
		reloadInvoicesSelection 
	End if 
Else 
	
	$years_list_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"years_list")
	
	$pos:=Find in array:C230($years_list_ptr->;String:C10($year))
	
	  //check year exist
	If ($pos=-1)
		APPEND TO ARRAY:C911($years_list_ptr->;String:C10($year))
		SORT ARRAY:C229($years_list_ptr->)
	End if 
	
	  //select invoice year
	Form:C1466.year:=$year
	$pos:=Find in array:C230($years_list_ptr->;String:C10($year))
	$years_list_ptr->:=$pos
	reloadInvoicesSelection 
End if 