//%attributes = {"shared":true}
  // __UNIT_TEST

$test:=New AJ_Tools_UT_describe ("Test the days_currentyear";Current method name:C684;"date")

$test.given:="no arguments"
$test.should:="return 0"
$test.expected:=0
$test.actual:=days_currentyear 
$test.assert()

$test.given:="Start and End the same year : 2019;!1.10.2019!;!30.10.2019!"
$test.should:="return 30"
$test.expected:=30
$test.actual:=days_currentyear (2019;!2019-10-01!;!2019-10-30!)
$test.assert()

$test.given:="Start the current year and end the next year : 2019;!1.10.2019!;!30.10.2020!"
$test.should:="return 92"
$test.expected:=92
$test.actual:=days_currentyear (2019;!2019-10-01!;!2020-10-30!)
$test.assert()

$test.given:="Start the previous year and end the next year : 2019;!1.10.2018!;!30.10.2020!"
$test.should:="return 365"
$test.expected:=457
$test.actual:=days_currentyear (2019;!2018-10-01!;!2020-10-30!)
$test.assert()

$test.given:="Start the previous year and end the current year : 2019;!1.10.2018!;!30.10.2019!"
$test.should:="return 303"
$test.expected:=395
$test.actual:=days_currentyear (2019;!2018-10-01!;!2019-10-30!)
$test.assert()

$test.given:="Start the previous year and end the previous year : 2019;!1.10.2018!;!30.10.2018!"
$test.should:="return 0"
$test.expected:=30
$test.actual:=days_currentyear (2019;!2018-10-01!;!2018-10-30!)
$test.assert()

$test.given:="Start the next year and end the next year : 2019;!1.10.2020!;!30.10.2020!"
$test.should:="return 0"
$test.expected:=0
$test.actual:=days_currentyear (2019;!2020-10-01!;!2020-10-30!)
$test.assert()

$test.given:="Start the next year and end the current year : 2019;!1.10.2020!;!30.10.2019!"
$test.should:="return 0"
$test.expected:=0
$test.actual:=days_currentyear (2019;!2020-10-01!;!2019-10-30!)
$test.assert()

$test.given:="Start the next year and end the previous year : 2019;!1.10.2020!;!30.10.2018!"
$test.should:="return 0"
$test.expected:=0
$test.actual:=days_currentyear (2019;!2020-10-01!;!2018-10-30!)
$test.assert()
