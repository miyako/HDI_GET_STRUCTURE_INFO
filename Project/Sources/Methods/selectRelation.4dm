//%attributes = {"invisible":true}
$name:=cbRelationList{cbRelationList}

var $oTable : Object
ARRAY OBJECT:C1221($arr; 0)

// search the selected relation in the oStructure Object
OB GET ARRAY:C1229(oStructure; "relation"; $arr)
For ($i; 1; Size of array:C274($arr))
	If ((OB Get:C1224($arr{$i}; "name_Nto1")+" - "+OB Get:C1224($arr{$i}; "name_1toN"))=$name)
		$oTable:=$arr{$i}
		$i:=Size of array:C274($arr)+1
	End if 
End for 

// display the information on the selected relation
displayRelation($oTable)