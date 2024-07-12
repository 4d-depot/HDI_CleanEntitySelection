

var $notDropped : cs:C1710.PersonsSelection


If (btnTrace)
	TRACE:C157
End if 


$notDropped:=Form:C1466.selected.drop()

Form:C1466.persons:=Form:C1466.persons

Form:C1466.dropDone:=True:C214

OBJECT SET ENABLED:C1123(*; "DropButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "CleanButton"; Form:C1466.dropDone=True:C214)