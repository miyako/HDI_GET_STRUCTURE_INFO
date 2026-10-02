//%attributes = {}
C_TEXT:C284($1)

C_TIME:C306(vhDoc)
vhDoc:=Create document:C266(""; $1)

If (OK=1)
	CLOSE DOCUMENT:C267(vhDoc)
	
	Case of 
		: ($1="xml")
			C_TEXT:C284($vTStruc)
			EXPORT STRUCTURE:C1311($vTStruc)
			TEXT TO DOCUMENT:C1237(Document; $vTStruc)
			
		: ($1="json")
			C_OBJECT:C1216($oStructure)
			$oStructure:=getDatabaseStructure
			TEXT TO DOCUMENT:C1237(Document; JSON Stringify:C1217($oStructure; *))
	End case 
	
	OPEN URL:C673(Document)
	
End if 