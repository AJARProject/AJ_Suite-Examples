//%attributes = {}
C_OBJECT:C1216($entities;$entity)

$entities:=ds:C1482.invoice.all()

$entities:=$entities.query(" invoice_date = :1 AND type = :2 AND currency = :3";Date:C102("01/01/2014");"debit";"€")

For each ($entity;$entities)
	$math:=Math 
	$entity.rate:=$math.roundDecimal($entity.amount_payed/$entity.amount_invoiced;0.0001;"ROUND_HALF_UP")
	  //$entity.amount_payed:=$entity.amount_invoiced*$entity.rate
	$ok:=$entity.save()
End for each 


