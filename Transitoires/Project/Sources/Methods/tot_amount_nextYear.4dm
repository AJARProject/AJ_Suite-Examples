//%attributes = {}
  // tot_amount_nextYear ( ) -> $total
  //
  // $total : (real) (return) total next year
  //
  // Calc total of the next year amount

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.01.20, 10:05:43
	  // ----------------------------------------------------
	  // Method: tot_amount_nextYear
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_REAL:C285($0;$total)
C_OBJECT:C1216($invoice)

For each ($invoice;Form:C1466.allInvoices)
	$total:=$total+amount_nextYear ($invoice)
End for each 

$0:=$total