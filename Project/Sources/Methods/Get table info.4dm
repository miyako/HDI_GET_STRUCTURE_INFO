//%attributes = {"invisible":true,"shared":true}

// ----------------------------------------------------
// User name (OS): Adrien Cagniant
// Date and time: 30/11/16, 17:28:19
// ----------------------------------------------------
// Method: Get field infos
// Description
// see former AP Get table info 4D Pack command
//
// Parameters: table ID
// ----------------------------------------------------

C_LONGINT:C283($1; $invisible; $destruct)
C_TEXT:C284($tableNumber; $oldErrorHandler)
ARRAY TEXT:C222($arrTableName; 0)
ARRAY TEXT:C222($arrRefTable; 0)

$tableNumber:=String:C10($1)

C_TEXT:C284($XMLStructure)
EXPORT STRUCTURE:C1311($XMLStructure)

$refXMLStructure:=DOM Parse XML variable:C720($xmlStructure)
$refXMLTable:=DOM Find XML element:C864($refXMLStructure; "base/table"; $arrRefTable)


$numberTable:=Size of array:C274($arrRefTable)

//loop on each table
For ($tableCounter; 1; $numberTable)
	// get each table ID / Number
	DOM GET XML ATTRIBUTE BY NAME:C728($arrRefTable{$tableCounter}; "id"; $tableID)
	
	//if it is the table we look for
	If ($tableID=$tableNumber)
		$oldErrorHandler:=Method called on error:C704
		ON ERR CALL:C155("errHandler")
		
		// get each table visible property
		$valueTableVisible:="Visible"
		$refXMLTableExtra:=DOM Find XML element:C864($arrRefTable{$tableCounter}; "table/table_extra")
		DOM GET XML ATTRIBUTE BY NAME:C728($refXMLTableExtra; "visible"; $valueTableVisible)
		If ($valueTableVisible="false")
			$valueTableVisible:="Invisible"
			$invisible:=1
		Else 
			$invisible:=0
		End if 
		
		// get each table deletion type property
		$valueTableDeletion:="Physical deletion"
		DOM GET XML ATTRIBUTE BY NAME:C728($arrRefTable{$tableCounter}; "leave_tag_on_delete"; $valueTableDeletion)
		If ($valueTableDeletion="true")
			$valueTableDeletion:="Logical deletion only"
			$destruct:=1
		Else 
			$destruct:=0
			
			//because it is bugged with AP GET TABLE INFO if you want to reproduce the same bug $destruct:=1
			
			
		End if 
		
		//return to default error managment.
		ON ERR CALL:C155($oldErrorHandler)
		
	End if 
End for 

$2->:=$invisible
$3->:=$destruct
