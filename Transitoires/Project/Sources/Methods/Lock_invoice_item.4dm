//%attributes = {}
  //activate/inactive protect
If (Form:C1466.btnProtect.protect)
	Form:C1466.btnProtect.Label(AJUI_btn_default;"Protect-Unprotect")
	Form:C1466.btnProtectBanner.DrawBanner()
	OBJECT SET VISIBLE:C603(*;"RectProtect";True:C214)
	Form:C1466.btnProtect.PicturePath(AJUI_btn_default;"invoice_lock/3994379---lock-padlock-privacy-protection-security.svg")
	  // inactive input fields except lock button
	OBJECT SET ENTERABLE:C238(*;"invoice_ref_value";False:C215)
	OBJECT SET ENTERABLE:C238(*;"amount_invoiced_value";False:C215)
	OBJECT SET ENTERABLE:C238(*;"amount_payed_value";False:C215)
	OBJECT SET ENTERABLE:C238(*;"rate_value";False:C215)
	OBJECT SET ENTERABLE:C238(*;"end_value";False:C215)
	OBJECT SET ENTERABLE:C238(*;"start_value";False:C215)
	OBJECT SET ENTERABLE:C238(*;"invoice_date_value";False:C215)
	OBJECT SET ENTERABLE:C238(*;"Form.discount";False:C215)
	
	
Else 
	Form:C1466.btnProtect.Label(AJUI_btn_default;"Unprotect-Protect")
	Form:C1466.btnProtectBanner.HideBanner()
	OBJECT SET VISIBLE:C603(*;"RectProtect";False:C215)
	Form:C1466.btnProtect.PicturePath(AJUI_btn_default;"invoice_lock/3994412---key-lock-open-password-unlock.svg")
	OBJECT SET ENTERABLE:C238(*;"invoice_ref_value";True:C214)
	OBJECT SET ENTERABLE:C238(*;"amount_invoiced_value";True:C214)
	OBJECT SET ENTERABLE:C238(*;"amount_payed_value";True:C214)
	OBJECT SET ENTERABLE:C238(*;"rate_value";True:C214)
	OBJECT SET ENTERABLE:C238(*;"end_value";True:C214)
	OBJECT SET ENTERABLE:C238(*;"start_value";True:C214)
	OBJECT SET ENTERABLE:C238(*;"invoice_date_value";True:C214)
	OBJECT SET ENTERABLE:C238(*;"Form.discount";True:C214)
	
End if 

Form:C1466.btnProtect.Draw()