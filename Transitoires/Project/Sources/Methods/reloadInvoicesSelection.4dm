//%attributes = {}
  // reloadInvoicesSelection ( ) 
  //
  //
  // Reload current invoices entities selection

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 09:09:39
	  // ----------------------------------------------------
	  // Method: reloadInvoicesSelection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_DATE:C307($startInvoiceYear;$endInvoiceYear;$searchDate)
C_OBJECT:C1216($invoices)
C_TEXT:C284($searchInvoice)

$invoices:=ds:C1482.invoice.all()


Case of 
	: (vSearch="@...@")
		
		C_COLLECTION:C1488($date)
		$date:=Split string:C1554(vSearch;"...")
		
		$startInvoiceYear:=Date:C102("01/01/"+String:C10(Form:C1466.year))
		$endInvoiceYear:=Date:C102("31/12/"+String:C10(Form:C1466.year))
		$dateStart:=Date:C102($date[0])
		$dateEnd:=Date:C102($date[1])
		
		If ($dateStart=Date:C102(""))
			$dateStart:=Date:C102("01/01/1960")
		End if 
		
		If ($dateEnd=Date:C102(""))
			$dateEnd:=Current date:C33
		End if 
		
		Case of 
			: (Form:C1466.currencyFilter#"") & (Form:C1466.typeFilter#"")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND type= :4 AND start >= :5 AND end <= :6";$startInvoiceYear;$endInvoiceYear;Form:C1466.currencyFilter;Form:C1466.typeFilter;$dateStart;$dateEnd)
				Form:C1466.ribbon.Message(Form:C1466.typeFilter+" "+Form:C1466.currencyFilter+" "+String:C10(Form:C1466.year))
			: (Form:C1466.currencyFilter="") & (Form:C1466.typeFilter#"")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND type= :3 AND start >= :4 AND end <= :5";$startInvoiceYear;$endInvoiceYear;Form:C1466.typeFilter;$dateStart;$dateEnd)
				Form:C1466.ribbon.Message(Form:C1466.typeFilter+" "+String:C10(Form:C1466.year))
			: (Form:C1466.currencyFilter#"") & (Form:C1466.typeFilter="")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND start >= :4 AND end <= :5";$startInvoiceYear;$endInvoiceYear;Form:C1466.currencyFilter;$dateStart;$dateEnd)
				Form:C1466.ribbon.Message(Form:C1466.currencyFilter+" "+String:C10(Form:C1466.year))
			Else 
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND start >= :3 AND end <= :4";$startInvoiceYear;$endInvoiceYear;$dateStart;$dateEnd)
				Form:C1466.ribbon.Message(String:C10(Form:C1466.year))
		End case 
		
	: (vSearch="@&@")
		
		C_COLLECTION:C1488($date)
		$date:=Split string:C1554(vSearch;"&")
		
		$startInvoiceYear:=Date:C102($date[0]+"/"+String:C10(Form:C1466.year))
		$endInvoiceYear:=Date:C102($date[1]+"/"+String:C10(Form:C1466.year))
		
		If ($startInvoiceYear=Date:C102(""))
			$startInvoiceYear:=Date:C102("01/01/"+String:C10(Form:C1466.year))
		End if 
		
		If ($endInvoiceYear=Date:C102(""))
			$endInvoiceYear:=Date:C102("31/12/"+String:C10(Form:C1466.year))
		End if 
		
		Case of 
			: (Form:C1466.currencyFilter#"") & (Form:C1466.typeFilter#"")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND type= :4 ";$startInvoiceYear;$endInvoiceYear;Form:C1466.currencyFilter;Form:C1466.typeFilter)
				Form:C1466.ribbon.Message(Form:C1466.typeFilter+" "+Form:C1466.currencyFilter+" "+String:C10(Form:C1466.year))
			: (Form:C1466.currencyFilter="") & (Form:C1466.typeFilter#"")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND type= :3 ";$startInvoiceYear;$endInvoiceYear;Form:C1466.typeFilter)
				Form:C1466.ribbon.Message(Form:C1466.typeFilter+" "+String:C10(Form:C1466.year))
			: (Form:C1466.currencyFilter#"") & (Form:C1466.typeFilter="")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 ";$startInvoiceYear;$endInvoiceYear;Form:C1466.currencyFilter)
				Form:C1466.ribbon.Message(Form:C1466.currencyFilter+" "+String:C10(Form:C1466.year))
			Else 
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 ";$startInvoiceYear;$endInvoiceYear)
				Form:C1466.ribbon.Message(String:C10(Form:C1466.year))
		End case 
		
	Else 
		$startInvoiceYear:=Date:C102("01/01/"+String:C10(Form:C1466.year))
		$endInvoiceYear:=Date:C102("31/12/"+String:C10(Form:C1466.year))
		$searchInvoice:="@"+vSearch+"@"
		$searchDate:=Date:C102(vSearch)
		
		Case of 
			: (Form:C1466.currencyFilter#"") & (Form:C1466.typeFilter#"")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND type= :4 AND (invoice_ref = :5 OR start = :6 OR end = :6)";$startInvoiceYear;$endInvoiceYear;Form:C1466.currencyFilter;Form:C1466.typeFilter;$searchInvoice;$searchDate)
				Form:C1466.ribbon.Message(Form:C1466.typeFilter+" "+Form:C1466.currencyFilter+" "+String:C10(Form:C1466.year))
			: (Form:C1466.currencyFilter="") & (Form:C1466.typeFilter#"")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND type= :3 AND (invoice_ref = :4 OR start = :5 OR end = :5)";$startInvoiceYear;$endInvoiceYear;Form:C1466.typeFilter;$searchInvoice;$searchDate)
				Form:C1466.ribbon.Message(Form:C1466.typeFilter+" "+String:C10(Form:C1466.year))
			: (Form:C1466.currencyFilter#"") & (Form:C1466.typeFilter="")
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND (invoice_ref = :4 OR start = :5 OR end = :5)";$startInvoiceYear;$endInvoiceYear;Form:C1466.currencyFilter;$searchInvoice;$searchDate)
				Form:C1466.ribbon.Message(Form:C1466.currencyFilter+" "+String:C10(Form:C1466.year))
			Else 
				Form:C1466.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND (invoice_ref = :3 OR start = :4 OR end = :4 )";$startInvoiceYear;$endInvoiceYear;$searchInvoice;$searchDate)
				Form:C1466.ribbon.Message(String:C10(Form:C1466.year))
		End case 
		
End case 


Form:C1466.tot_nextYear:=tot_amount_nextYear 
Form:C1466.tot_currentYear:=tot_amount_currentYear 
Form:C1466.ribbon.DrawBanner()

