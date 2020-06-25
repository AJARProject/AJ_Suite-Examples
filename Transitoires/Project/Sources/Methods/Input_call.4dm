//%attributes = {}
  // Input_call ( $process ) 
  //
  // $process : (boolean) new process
  //
  // Launch the input form

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.01.20, 10:47:03
	  // ----------------------------------------------------
	  // Method: Input_call
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_BOOLEAN:C305($1)

If (Count parameters:C259=0)
	$ref_process:=New process:C317(Current method name:C684;0;Current method name:C684;True:C214)
	SHOW PROCESS:C325($ref_process)
	BRING TO FRONT:C326($ref_process)
Else 
	$setup_obj:=setupFormObject 
	C_TEXT:C284(vSearch)
	$ref_win:=Open form window:C675("Input";Plain form window:K39:10;On the left:K39:2;At the top:K39:5)
	DIALOG:C40("Input";$setup_obj)
	CLOSE WINDOW:C154($ref_win)
End if 