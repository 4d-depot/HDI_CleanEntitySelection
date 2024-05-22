Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		importData
		
		Form:C1466.persons:=ds:C1482.Persons.all()
		
		Form:C1466.dropDone:=False:C215
		
		OBJECT SET ENABLED:C1123(*; "DropButton"; False:C215)
		OBJECT SET ENABLED:C1123(*; "CleanButton"; Form:C1466.dropDone=True:C214)
		
		
		
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Get application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
	: (Form event code:C388=On Page Change:K2:54)
		importData
		
		Form:C1466.persons2:=ds:C1482.Persons.query("ID <= :1"; 3)
		
		Form:C1466.getEntitySet:="/rest/Persons?$filter=\"ID<=3\"&$method=entityset"
		
		OBJECT SET ENABLED:C1123(*; "PersonsListdropButton"; False:C215)
		
		
		OBJECT SET VISIBLE:C603(*; "EntitySet@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "GetEntitySet@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "CleanEntitySet@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "PersonsList@"; False:C215)
		
End case 

