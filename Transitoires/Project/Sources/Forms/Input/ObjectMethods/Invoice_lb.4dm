$evt:=Form event code:C388

Case of 
	: ($evt=On Clicked:K2:4) & (Contextual click:C713)
		
		If (Form:C1466.invoice_items.length>=1)
			
			$refMenu:=Create menu:C408
			APPEND MENU ITEM:C411($refMenu;"Lock selection")
			SET MENU ITEM PARAMETER:C1004($refMenu;-1;"lock")
			APPEND MENU ITEM:C411($refMenu;"Unlock selection")
			SET MENU ITEM PARAMETER:C1004($refMenu;-1;"unlock")
			APPEND MENU ITEM:C411($refMenu;"Delete selection")
			SET MENU ITEM PARAMETER:C1004($refMenu;-1;"delete")
			
			$choix:=Dynamic pop up menu:C1006($refMenu)
			RELEASE MENU:C978($refMenu)
			
			If ($choix#"")
				Case of 
					: ($choix="lock")
						lockOrUnlockSelection (True:C214)
					: ($choix="unlock")
						lockOrUnlockSelection (False:C215)
					: ($choix="delete")
						deleteSelection 
				End case 
			End if 
		End if 
		
		
	: ($evt=On Clicked:K2:4) | ($evt=On Selection Change:K2:29)
		C_LONGINT:C283($row;$column)
		
		LISTBOX GET CELL POSITION:C971(*;"Invoice_lb";$column;$row)
		If ($row>0)
			
			Form:C1466.currentInvoice.UUID:=Form:C1466.invoice_item.UUID
			Form:C1466.currentInvoice.invoice_ref:=Form:C1466.invoice_item.invoice_ref
			Form:C1466.currentInvoice.start:=Form:C1466.invoice_item.start
			Form:C1466.currentInvoice.oldStart:=Form:C1466.invoice_item.start
			Form:C1466.currentInvoice.end:=Form:C1466.invoice_item.end
			Form:C1466.currentInvoice.oldEnd:=Form:C1466.invoice_item.end
			Form:C1466.currentInvoice.invoice_date:=Form:C1466.invoice_item.invoice_date
			Form:C1466.currentInvoice.amount_invoiced:=Form:C1466.invoice_item.amount_invoiced
			Form:C1466.currentInvoice.amount_payed:=Form:C1466.invoice_item.amount_payed
			Form:C1466.currentInvoice.rate:=Form:C1466.invoice_item.rate
			
			Form:C1466.btnProtect.protect:=Form:C1466.invoice_item.locked
			
			Lock_invoice_item 
			
			  //type
			Form:C1466.currentInvoice.type:=Form:C1466.invoice_item.type
			Form:C1466.bc1.SetCurrentSection(Form:C1466.invoice_item.type)
			Form:C1466.bc1.Draw()
			
			  //currency
			Form:C1466.currentInvoice.currency:=Form:C1466.invoice_item.currency
			Form:C1466.bc4.SetCurrentSection(Form:C1466.invoice_item.currency)
			Form:C1466.bc4.Draw()
			
			Form:C1466.btnSave.Enable(False:C215)
			
			GOTO OBJECT:C206(*;"invoice_ref_value")
		End if 
End case 
