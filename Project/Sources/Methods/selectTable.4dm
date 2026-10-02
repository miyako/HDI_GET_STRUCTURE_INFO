//%attributes = {"invisible":true}
$name:=cbTableList{cbTableList}

var $oTable : Object
ARRAY OBJECT:C1221($arrTable; 0)

// search the selected table in the oStructure Object
OB GET ARRAY:C1229(oStructure; "table"; $arrTable)
For ($i; 1; Size of array:C274($arrTable))
	If (OB Get:C1224($arrTable{$i}; "name")=$name)
		$oTable:=$arrTable{$i}
		$i:=Size of array:C274($arrTable)+1
	End if 
End for 

// display the information on the selected table
displayTableInfo($oTable)

// display the list of field with its information
displayField($oTable)