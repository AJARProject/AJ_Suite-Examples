

Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($btn)
		$btn:=New object:C1471()
		$btn.templateName:="invoice_lock"
		$btn.templatePath:=Get 4D folder:C485(Current resources folder:K5:16)+"invoice_lock"+Folder separator:K24:12
		
		Form:C1466.btnProtect:=New AJUI_Button ($btn)
		Form:C1466.btnProtect.Name("btnProtect")
		
		Form:C1466.btnProtect.protect:=False:C215
		
		
		bannerProtectRibbon 
		
		  //check template protect
		  //If (Form.btnAdd.protect)
		  //Form.btnProtect.Label(AJUI_btn_default;"Unprotect/Protect")
		  //Form.btnProtectBanner.DrawBanner()
		  //OBJECT SET VISIBLE(*;"RectProtect";True)
		  //Form.btnProtect.PicturePath(AJUI_btn_default;"invoice_lock/3994412---key-lock-open-password-unlock.svg")
		  //Else 
		  //Form.btnProtect.Label(AJUI_btn_default;"Protect/Unprotect")
		  //Form.btnProtectBanner.HideBanner()
		  //OBJECT SET VISIBLE(*;"RectProtect";False)
		  //Form.btnProtect.PicturePath(AJUI_btn_default;"invoice_lock/3994379---lock-padlock-privacy-protection-security.svg")
		  //End if 
		
		Lock_invoice_item 
		
		Form:C1466.tipProtect:=tip_templatesButtons ("btnProtect";"")
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		If (OBJECT Get enabled:C1079(*;"btnProtect"))
			Form:C1466.tipProtect.TextLabel(Form:C1466.btnProtect.Label(AJUI_btn_default))
			Form:C1466.tipProtect.Show()
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		Form:C1466.tipProtect.Hide()
		
		
		
	: (Form event code:C388=On Clicked:K2:4)
		Form:C1466.tipProtect.Hide()
		Form:C1466.btnProtect.protect:=Not:C34(Form:C1466.btnProtect.protect)  // toggle
		Lock_invoice_item 
		
		If (Macintosh option down:C545) & (Form:C1466.invoice_items.length>=1)  //Lock or unlock invoice selection 
			lockOrUnlockSelection 
		Else 
			Form:C1466.btnSave.Enable(True:C214)
			Form:C1466.btnSave.Draw()
		End if 
		
		
End case 

Form:C1466.btnProtect.Draw()