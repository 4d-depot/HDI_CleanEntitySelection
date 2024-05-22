Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		importData
		
		Form:C1466.persons:=ds:C1482.Persons.all()
		
		Form:C1466.dropDone:=False:C215
		
		OBJECT SET ENABLED:C1123(*; "DropButton"; Form:C1466.selected.length>=1)
		OBJECT SET ENABLED:C1123(*; "CleanButton"; Form:C1466.dropDone=True:C214)
		
		
		Form:C1466.getEntitySet:="http://127.0.0.1:8044/rest/Persons?$filter=\"ID<=4\"&$method=entityset"
		
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Get application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
	: (Form event code:C388=On Page Change:K2:54)
		importData
		
		Form:C1466.persons2:=ds:C1482.Persons.query("ID <= :1"; 4)
		
		OBJECT SET ENABLED:C1123(*; "DropButton2"; Form:C1466.selected.length>=1)
		
		
End case 

