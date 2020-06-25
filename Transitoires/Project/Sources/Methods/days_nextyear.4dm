//%attributes = {}

  // days_nextyear ( year ; start ; end ) -> days
  //
  // year : (longint) current year to evaluate
  // start : (date) date start invoice
  // end : (date) date end invoice duration
  // days : (longint) return number of days 

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 20.01.20, 13:37:09
	  // ----------------------------------------------------
	  // Method: days_currentyear
	  // Description
	  // Calculation of days starting next year until the end OR if
	  // start is after the start of the year the number of days
	  // for the duration
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$days)
C_LONGINT:C283($year;$1)
C_DATE:C307($start;$2)
C_DATE:C307($end;$3)
C_LONGINT:C283($yearToAdd)


$year:=$1
$start:=$2
$end:=$3



$year_end:=Add to date:C393(!00-00-00!;$year;12;31)  // last day of the next year


If ($year>0)
	
	If (Year of:C25($end)<=$year)
		$days:=0
	Else 
		If ($start>$year_end)
			$days:=$end-$start+1
		Else 
			$days:=$end-$year_end
		End if 
	End if 
	
Else 
	$days:=0
End if 

$0:=$days