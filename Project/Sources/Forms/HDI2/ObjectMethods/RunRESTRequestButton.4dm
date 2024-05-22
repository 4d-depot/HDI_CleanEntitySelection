
var $headers : Object:={Cookie: ""}
var $requestObj; $request : Object

var $start; $end : Integer
var $info : Object
var $cookie : Text


If (btnTrace)
	TRACE:C157
End if 



$headers:=buildHeaders
$requestObj:={method: HTTP GET method:K71:1; headers: $headers}
$request:=4D:C1709.HTTPRequest.new(Form:C1466.getEntitySet; $requestObj).wait()

$cookie:=$request.response.headers["set-cookie"]
$start:=Position:C15("4DSID_HDI_CleanEntitySelecition"; $cookie)
$end:=Position:C15(";"; $cookie)
Form:C1466.sessionCookie:=Substring:C12($cookie; $start; $end-$start)

If ($request.response.body#Null:C1517)
	Form:C1466.response:=$request.response.body
End if 


$uri:=Form:C1466.response["__ENTITYSET"]

$pos:=Position:C15("$entitySet/"; $uri)
$index:=$pos+11

Form:C1466.entitySet:=Substring:C12($uri; $index)

Form:C1466.entitySetURL:="http://127.0.0.1:8044/rest/Persons/$entityset/"+Form:C1466.entitySet

Form:C1466.cleanEntitySetURL:=Form:C1466.entitySetURL+"?$clean=true&$method=entityset"

OBJECT SET VISIBLE:C603(*; "EntitySet"; True:C214)
