//%attributes = {}
  // setupFormObject ( ) -> $setup_obj
  //
  // $setup_obj : (object) Form properties
  //
  // Setup Form object

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.20, 12:39:14
	  // ----------------------------------------------------
	  // Method: setupFormObject
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_OBJECT:C1216($setup_obj)

$setup_obj:=New object:C1471

  //invoice current
$setup_obj.currentInvoice:=New object:C1471

  //floating label
$setup_obj.showOnEmptyField:=True:C214

  //setup filter
$setup_obj.typeFilter:="Debit"
$setup_obj.currencyFilter:="Frs"
$setup_obj.year:=Year of:C25(Current date:C33)
$setup_obj.search:=""

  // discount
$setup_obj.discount:=0

  //tot
$setup_obj.tot_currentYear:=0
$setup_obj.tot_nextYear:=0

  //setup banner
$setup_obj.ribbon:=New AJUI_Banner 
$setup_obj.ribbon.BannerType("cornerRibbon")
$setup_obj.ribbon.BannerName("resume")
$setup_obj.ribbon.Message("No filter")
$setup_obj.ribbon.BannerPosition("top-right")
$setup_obj.ribbon.TextColor("White")
$setup_obj.ribbon.TextFontSize(18)
$setup_obj.ribbon.TextFontWeight("bold")
$setup_obj.ribbon.BannerBGColor("blue:70")
$setup_obj.ribbon.BorderColor("blue")
$setup_obj.ribbon.BorderSize(2)
$setup_obj.ribbon.BannerHeight(80)
$setup_obj.ribbon.BannerWidth(200)

$0:=$setup_obj