//%attributes = {"invisible":true}
#DECLARE($format : Text)

var vhDoc : Time
vhDoc:=Create document:C266(""; $format)

If (OK=1)
	CLOSE DOCUMENT:C267(vhDoc)
	
	Case of 
		: ($format="xml")
			var $vTStruc : Text
			EXPORT STRUCTURE:C1311($vTStruc)
			TEXT TO DOCUMENT:C1237(Document; $vTStruc)
			
		: ($format="json")
			var $oStructure : Object
			$oStructure:=getDatabaseStructure
			TEXT TO DOCUMENT:C1237(Document; JSON Stringify:C1217($oStructure; *))
	End case 
	
	OPEN URL:C673(Document)
	
End if 
