

var $notDropped : cs:C1710.PersonsSelection


If (btnTrace)
	TRACE:C157
End if 


$notDropped:=Form:C1466.selected.drop()

Form:C1466.persons2:=Form:C1466.persons2.clean()


OBJECT SET VISIBLE:C603(*; "GetEntitySet@"; True:C214)