Case of 
		
	: (Form event code:C388=On Load:K2:1)
		var oStructure : Object
		ARRAY TEXT:C222(cbTableList; 0)
		ARRAY TEXT:C222(cbIndexList; 0)
		ARRAY TEXT:C222(cbRelationList; 0)
		ARRAY OBJECT:C1221($arr; 0)
		
		// retrieve database structure in the oStructure Object variable
		oStructure:=getDatabaseStructure
		OB GET ARRAY:C1229(oStructure; "table"; $arr)
		
		// create table list
		For ($i; 1; Size of array:C274($arr))
			APPEND TO ARRAY:C911(cbTableList; OB Get:C1224($arr{$i}; "name"))
		End for 
		
		cbTableList:=1
		selectTable
		
		// create index list
		OB GET ARRAY:C1229(oStructure; "index"; $arr)
		For ($i; 1; Size of array:C274($arr))
			
			If (OB Is defined:C1231($arr{$i}; "name")=True:C214)
				APPEND TO ARRAY:C911(cbIndexList; OB Get:C1224($arr{$i}; "name")+" - "+OB Get:C1224($arr{$i}; "uuid"))
			Else 
				APPEND TO ARRAY:C911(cbIndexList; Localized string("IndexNoName")+" - "+OB Get:C1224($arr{$i}; "uuid"))
			End if 
		End for 
		
		cbIndexList:=1
		selectIndex
		
		// create relation list
		OB GET ARRAY:C1229(oStructure; "relation"; $arr)
		For ($i; 1; Size of array:C274($arr))
			APPEND TO ARRAY:C911(cbRelationList; OB Get:C1224($arr{$i}; "name_Nto1")+" - "+OB Get:C1224($arr{$i}; "name_1toN"))
		End for 
		
		cbRelationList:=1
		selectRelation
		
		// retrieve the Choice list
		ARRAY LONGINT:C221($arrNb; 0)
		ARRAY TEXT:C222(arrChoiceListName; 0)
		LIST OF CHOICE LISTS:C957($arrNb; arrChoiceListName)
		
		
		OBJECT SET ENABLED:C1123(*; "Table_@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "Relation_@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "Index_@"; False:C215)
		
		
End case 