$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		OBJECT SET VISIBLE:C603(*;"rate";Not:C34(<>isFrs))
		OBJECT SET VISIBLE:C603(*;"amount_invoiced_eur";Not:C34(<>isFrs))
		
		OBJECT SET TITLE:C194(*;"days_current_year_head";<>days_currentYear_title)
		OBJECT SET TITLE:C194(*;"days_next_year_head";<>days_nextYear_title)
		OBJECT SET TITLE:C194(*;"amount_this_year_head";<>amount_currentYear_title)
		OBJECT SET TITLE:C194(*;"amount_next_year_head";<>amount_nextYear_title)
End case 
