//%attributes = {}

  // days_currentyear ( year ; start ; end ) -> days
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
	  // Calculation of days until the end of the year OR if
	  // end is before the end of the year the number of days
	  // for the duration
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$days)
C_LONGINT:C283($year;$1)
C_DATE:C307($start;$2)
C_DATE:C307($end;$3)

$year:=$1
$start:=$2
$end:=$3

$year_start:=Add to date:C393(!00-00-00!;$year;1;1)  // first day of the year
$year_end:=Add to date:C393(!00-00-00!;$year;12;31)  // last day of the year

If ($year>0)
	
	Case of 
		: (Year of:C25($start)=$year)  // start is the same year
			Case of 
				: (Year of:C25($end)=$year)  // end is the same year
					$days:=$end-$start+1
				: (Year of:C25($end)>$year)  // end is the next year
					$days:=$year_end-$start+1
				Else 
					$days:=0
			End case 
		: (Year of:C25($start)>$year)  // start is the next year
			$days:=0
		: (Year of:C25($start)<$year)  // start is the previous year
			Case of 
				: (Year of:C25($end)<=$year)  // end is the same year
					$days:=$end-$start+1
				: (Year of:C25($end)>$year)  // end is the next year
					$days:=$year_end-$start+1
			End case 
	End case 
Else 
	$days:=0
End if 

$0:=$days