//%attributes = {}
  // amount_currentYear ( $invoice  ) -> $amount
  //
  // $invoice : (object) invoice 
  // $amount : (amount) (return) amount current year
  //
  // Calc amount current year for an invoice

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.20, 15:22:26
	  // ----------------------------------------------------
	  // Method: amount_currentYear
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$invoice)
C_REAL:C285($0;$amount)
C_LONGINT:C283($dayCurrentYear;$dayNextYear)

$invoice:=$1

$dayCurrentYear:=days_currentyear (Form:C1466.year;$invoice.start;$invoice.end)
$dayNextYear:=days_nextyear (Form:C1466.year;$invoice.start;$invoice.end)

If ($invoice.currency="Frs")
	$amount:=$invoice.amount_invoiced
Else 
	$amount:=$invoice.amount_payed
End if 

$amount:=$amount/($dayCurrentYear+$dayNextYear)*$dayCurrentYear
$math:=Math 
$amount:=$math.roundDecimal($amount;0.05;"ROUND_HALF_UP")
$0:=$amount