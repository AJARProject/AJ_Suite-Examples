//%attributes = {"shared":true}
  // print_selection_cb (  ) 
  //
  // Print the current selection

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.02.20, 09:24:49
	  // ----------------------------------------------------
	  // Method: print_selection_cb
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_BOOLEAN:C305($over;$done)
C_LONGINT:C283($count)
C_TEXT:C284(<>page)


SET PRINT OPTION:C733(Orientation option:K47:2;2)
SET PRINT OPTION:C733(Scale option:K47:3;80)
PRINT SETTINGS:C106



If (OK=1)
	prepareDataToPrint 
	
	OPEN PRINTING JOB:C995
	$over:=False:C215
	gError:=0
	$count:=1
	FORM LOAD:C1103("print_form")
	
	ON ERR CALL:C155("err")
	
	Repeat 
		$done:=Print object:C1095(*;"print_label")
		$done:=Print object:C1095(*;"Invoice_lb")
		
		<>page:="Page "+String:C10($count)
		$done:=Print object:C1095(*;"print_page")
		$done:=Print object:C1095(*;"print_date")
		
		LISTBOX GET PRINT INFORMATION:C1110(*;"Invoice_lb";lk printing is over:K53:14;$over)
		If (Not:C34($over))
			PAGE BREAK:C6
		End if 
		If (gError=-128)  //l'utilisateur a annulé l'opération
			$over:=True:C214
		End if 
		$count:=$count+1
	Until ($over)
	
	CLOSE PRINTING JOB:C996
	
	ON ERR CALL:C155("")
	
End if 