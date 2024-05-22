//%attributes = {}

var $fileContent : Text
var $coll : Collection
var $persons : cs:C1710.PersonsSelection


TRUNCATE TABLE:C1051([Persons:2])
SET DATABASE PARAMETER:C642([Persons:2]; Table sequence number:K37:31; 0)


$fileContent:=File:C1566("/RESOURCES/Persons.json").getText("UTF-8")
$coll:=JSON Parse:C1218($fileContent)

$persons:=ds:C1482.Persons.fromCollection($coll)
