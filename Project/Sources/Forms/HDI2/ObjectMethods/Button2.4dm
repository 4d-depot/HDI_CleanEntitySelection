

If (btnTrace)
	TRACE:C157
End if 


importData

Form:C1466.persons:=ds:C1482.Persons.all()

Form:C1466.dropDone:=False:C215

OBJECT SET ENABLED:C1123(*; "DropButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "CleanButton"; Form:C1466.dropDone=True:C214)
