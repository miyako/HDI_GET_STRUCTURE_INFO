//%attributes = {"invisible":true}
$name:=cbIndexList{cbIndexList}

var $oTable : Object
ARRAY OBJECT:C1221($arrIndex; 0)

// search the selected index in the oStructure Object
OB GET ARRAY:C1229(oStructure; "index"; $arrIndex)
For ($i; 1; Size of array:C274($arrIndex))
	If (OB Is defined:C1231($arrIndex{$i}; "name")=True:C214)
		If ((OB Get:C1224($arrIndex{$i}; "name")+" - "+OB Get:C1224($arrIndex{$i}; "uuid"))=$name)
			$oTable:=$arrIndex{$i}
			$i:=Size of array:C274($arrIndex)+1
		End if 
	Else 
		If ((Localized string("IndexNoName")+" - "+OB Get:C1224($arrIndex{$i}; "uuid"))=$name)
			$oTable:=$arrIndex{$i}
			$i:=Size of array:C274($arrIndex)+1
		End if 
	End if 
End for 

// display the information on the selected index
displayIndex($oTable)