//%attributes = {}


var $result : Object


If (btnTrace)
	TRACE:C157
End if 

$result:=New object:C1471()



If (Storage:C1525.session.cookie#Null:C1517)
	$result["Cookie"]:=Storage:C1525.session.cookie
Else 
	$result["Cookie"]:=""
End if 

return $result