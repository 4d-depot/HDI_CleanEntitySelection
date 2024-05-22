//%attributes = {}


var $result : Object


If (btnTrace)
	TRACE:C157
End if 

$result:=New object:C1471()

If (Form:C1466.sessionCookie#Null:C1517)
	$result["Cookie"]:=Form:C1466.sessionCookie
Else 
	$result["Cookie"]:=""
End if 

return $result