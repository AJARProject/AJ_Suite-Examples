C_POINTER:C301($years_list_ptr)
C_OBJECT:C1216($invoices)

$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		C_LONGINT:C283($min;$max;$currentYear)
		
		  //ADD YEARS
		$years_list_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
		CLEAR VARIABLE:C89($years_list_ptr->)
		
		$invoices:=ds:C1482.invoice.all()
		
		If ($invoices.length>0)
			$min:=Year of:C25($invoices.min("invoice_date"))
			$max:=Year of:C25($invoices.max("invoice_date"))
			APPEND TO ARRAY:C911($years_list_ptr->;String:C10($min))
			
			If ($max>$min)
				For ($i;1;$max-$min)
					APPEND TO ARRAY:C911($years_list_ptr->;String:C10($min+$i))
				End for 
			End if 
			
			$currentYear:=Year of:C25(Current date:C33)
			
			$pos:=Find in array:C230($years_list_ptr->;String:C10($currentYear))
			
			If ($pos>0)
				$years_list_ptr->:=$pos
				Form:C1466.year:=$currentYear
			Else 
				$years_list_ptr->:=Size of array:C274($years_list_ptr->)
				Form:C1466.year:=Num:C11($years_list_ptr->{$years_list_ptr->})
			End if 
			  //load invoices
		End if 
		reloadInvoicesSelection 
		
	: ($evt=On Data Change:K2:15)
		
		$years_list_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
		Form:C1466.year:=Num:C11($years_list_ptr->{$years_list_ptr->})
		reloadInvoicesSelection 
		reloadListAndInputArea 
End case 
