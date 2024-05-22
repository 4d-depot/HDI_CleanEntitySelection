
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
$request:=4D:C1709.HTTPRequest.new("http://127.0.0.1:8044"+Form:C1466.cleanEntitySetURL; $requestObj).wait()

$cookie:=$request.response.headers["set-cookie"]
$start:=Position:C15("4DSID_HDI_CleanEntitySelecition"; $cookie)
$end:=Position:C15(";"; $cookie)

Use (Storage:C1525.session)
	Storage:C1525.session.cookie:=Substring:C12($cookie; $start; $end-$start)
End use 

If ($request.response.body#Null:C1517)
	Form:C1466.response:=$request.response.body
End if 

