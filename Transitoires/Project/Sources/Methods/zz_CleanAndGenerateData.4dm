//%attributes = {}
  //C_OBJECT($entities;$entity)

  //$entities:=ds.invoice.all()

  //$entities.drop()

  //For ($i;1;10000)  //10 years debit 
  //$entity:=ds.invoice.new()

  //$year:=(Random%11)+2010
  //$month:=(Random%12)+1
  //$day:=(Random%28)+1

  //$date:=Date(String($day)+"/"+String($month)+"/"+String($year))
  //$entity.start:=$date
  //$entity.invoice_date:=$date
  //$entity.end:=Add to date($date;0;(Random%12)+1;0)

  //$entity.invoice_ref:="AJ"+String((Random%90000)+10000)+String($year)


  //$amount:=(Random%4951)+50
  //$entity.amount_invoiced:=$amount

  //$rate:=(Random%15)+4
  //$entity.rate:=$rate/10
  //$entity.amount_payed:=$amount*($rate/10)

  //$currency:=(Random%3)+1
  //Case of 
  //: ($currency=1)
  //$entity.currency:="Frs"
  //: ($currency=2)
  //$entity.currency:="€"
  //: ($currency=3)
  //$entity.currency:="$"
  //End case 

  //$type:=(Random%2)+1

  //Case of 
  //: ($type=1)
  //$entity.type:="debit"
  //: ($type=2)
  //$entity.type:="credit"
  //End case 


  //$locked:=(Random%2)+1

  //Case of 
  //: ($locked=1)
  //$entity.locked:=True
  //: ($locked=2)
  //$entity.locked:=False
  //End case 

  //$entity.save()
  //End for 

