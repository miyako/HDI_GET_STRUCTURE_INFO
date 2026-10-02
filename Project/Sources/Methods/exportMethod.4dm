//%attributes = {}
C_TEXT:C284($code)
C_TEXT:C284($contents)

$code:=METHOD Get path:C1164(Path project method:K72:1; "Get field info")
METHOD GET CODE:C1190($code; $contents; 1)
TEXT TO DOCUMENT:C1237("Get_field_info.txt"; $contents)

$code:=METHOD Get path:C1164(Path project method:K72:1; "Get table info")
METHOD GET CODE:C1190($code; $contents; 1)
TEXT TO DOCUMENT:C1237("Get_table_info.txt"; $contents)

$code:=METHOD Get path:C1164(Path project method:K72:1; "getDatabaseStructure")
METHOD GET CODE:C1190($code; $contents; 1)
TEXT TO DOCUMENT:C1237("getDatabaseStructure.txt"; $contents)

$code:=METHOD Get path:C1164(Path project method:K72:1; "getTablesAndFields")
METHOD GET CODE:C1190($code; $contents; 1)
TEXT TO DOCUMENT:C1237("getTablesAndFields.txt"; $contents)

$code:=METHOD Get path:C1164(Path project method:K72:1; "getIndex")
METHOD GET CODE:C1190($code; $contents; 1)
TEXT TO DOCUMENT:C1237("getIndex.txt"; $contents)

$code:=METHOD Get path:C1164(Path project method:K72:1; "getRelations")
METHOD GET CODE:C1190($code; $contents; 1)
TEXT TO DOCUMENT:C1237("getRelations.txt"; $contents)