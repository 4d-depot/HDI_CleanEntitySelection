
var $headers : Object:={Cookie: ""}
var $requestObj; $request : Object

var $start; $end; $pos; $index : Integer
var $cookies : Collection
var $cookie; $uri : Text


If (btnTrace)
	TRACE:C157
End if 



$headers:=buildHeaders
$requestObj:={method: HTTP GET method:K71:1; headers: $headers}
$request:=4D:C1709.HTTPRequest.new("http://127.0.0.1:8044"+Form:C1466.getEntitySet; $requestObj).wait()

If (Value type:C1509($request.response.headers["set-cookie"])=Is collection:K8:32)
	$cookies:=$request.response.headers["set-cookie"]
	$cookie:=$cookies.find(Formula:C1597((Position:C15("4DSID_HDI_CleanEntitySelection"; $1.value)#0)))
Else 
	$cookie:=$request.response.headers["set-cookie"]
End if 


$start:=Position:C15("4DSID_HDI_CleanEntitySelection"; $cookie)
$end:=Position:C15(";"; $cookie)


If (Storage:C1525.session.cookie="")
	Use (Storage:C1525.session)
		Storage:C1525.session.cookie:=Substring:C12($cookie; $start; $end-$start)
	End use 
End if 

If ($request.response.body#Null:C1517)
	Form:C1466.response:=$request.response.body
End if 


$uri:=Form:C1466.response["__ENTITYSET"]

$pos:=Position:C15("$entitySet/"; $uri)
$index:=$pos+11

Form:C1466.entitySet:=Substring:C12($uri; $index)

Form:C1466.entitySetURL:="/rest/Persons/$entityset/"+Form:C1466.entitySet

Form:C1466.cleanEntitySetURL:=Form:C1466.entitySetURL+"?$clean=true&$method=entityset"

OBJECT SET VISIBLE:C603(*; "EntitySet@"; True:C214)

OBJECT SET VISIBLE:C603(*; "PersonsList@"; True:C214)