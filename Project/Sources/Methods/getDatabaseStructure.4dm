//%attributes = {}

// ----------------------------------------------------
// User name (OS): Vanessa Talbot
// Date and time: 17/01/17, 11:39:00
// ----------------------------------------------------
// Method: getDatabaseStructure
// Description
//   * Call getTablesAndFields method
//   * Call getIndex method
//   * Call getRelations method
//
// Parameters
//   return an C_Object that contains all database information (table, field, index, relation)
// ----------------------------------------------------


C_OBJECT:C1216($oStructure)
ARRAY OBJECT:C1221($arrTmp; 0)

// getTablesAndFields
OB GET ARRAY:C1229(getTablesAndFields; "table"; $arrTmp)
OB SET ARRAY:C1227($oStructure; "table"; $arrTmp)

//getIndex 
OB GET ARRAY:C1229(getIndex; "index"; $arrTmp)
OB SET ARRAY:C1227($oStructure; "index"; $arrTmp)

//getRelations 
OB GET ARRAY:C1229(getRelations; "relation"; $arrTmp)
OB SET ARRAY:C1227($oStructure; "relation"; $arrTmp)

$0:=$oStructure