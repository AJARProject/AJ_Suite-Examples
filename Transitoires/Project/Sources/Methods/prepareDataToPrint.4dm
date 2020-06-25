//%attributes = {}
  // prepareDataToPrint (  ) 
  //
  //
  // Prepare the data for the print

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.02.20, 11:49:33
	  // ----------------------------------------------------
	  // Method: prepareDataToPrint
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_COLLECTION:C1488(<>allInvoices_selection)
C_REAL:C285(<>invoice_count;<>tot_amount_invoiced;<>tot_amount_payed;<>amount_this_year;<>amount_next_year)
C_BOOLEAN:C305(<>isFrs)
C_TEXT:C284(<>print_label;<>amount_nextYear_title;<>amount_currentYear_title;<>days_nextYear_title;<>days_currentYear_title;<>total)
C_OBJECT:C1216($invoice)

<>allInvoices_selection:=Form:C1466.allInvoices.toCollection()

<>allInvoices_selection:=<>allInvoices_selection.orderBy("invoice_date asc, invoice_ref asc")

  //listbox content
For each ($invoice;<>allInvoices_selection)
	$invoice.days_currentyear:=days_currentyear (Form:C1466.year;$invoice.start;$invoice.end)
	$invoice.days_nextyear:=days_nextyear (Form:C1466.year;$invoice.start;$invoice.end)
	$invoice.amount_currentYear:=amount_currentYear ($invoice)
	$invoice.amount_nextYear:=amount_nextYear ($invoice)
End for each 

<>invoice_count:=<>allInvoices_selection.count("invoice_ref")
<>tot_amount_invoiced:=<>allInvoices_selection.sum("amount_invoiced")
<>tot_amount_payed:=<>allInvoices_selection.sum("amount_payed")
<>amount_this_year:=<>allInvoices_selection.sum("amount_currentYear")
<>amount_next_year:=<>allInvoices_selection.sum("amount_nextYear")

<>print_label:=" Summary - "+Form:C1466.typeFilter+" "+Form:C1466.currencyFilter+" "+String:C10(Form:C1466.year)

If (Form:C1466.currencyFilter="Frs")
	<>isFrs:=True:C214
Else 
	<>isFrs:=False:C215
End if 

  //title
<>days_currentYear_title:="Days ("+String:C10(Form:C1466.year)+")"
<>days_nextYear_title:="Days ("+String:C10(Form:C1466.year+1)+")"
<>amount_currentYear_title:="Amount ("+String:C10(Form:C1466.year)+")"
<>amount_nextYear_title:="Amount ("+String:C10(Form:C1466.year+1)+")"
<>total:="Total"
