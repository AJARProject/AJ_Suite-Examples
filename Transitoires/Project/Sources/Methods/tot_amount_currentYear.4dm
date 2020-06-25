//%attributes = {}
  // tot_amount_currentYear ( ) -> $total
  //
  // $total : (real) (return) total current year
  //
  // Calc total of the current year amount

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.01.20, 10:05:26
	  // ----------------------------------------------------
	  // Method: tot_amount_currentYear
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_REAL:C285($0;$total)
C_OBJECT:C1216($invoice)

For each ($invoice;Form:C1466.allInvoices)
	$total:=$total+amount_currentYear ($invoice)
End for each 

$0:=$total