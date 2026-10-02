//the button already has "accept" standard action
If (Form event code:C388=On Clicked)
	
	var $window : Integer
	$window:=Open form window("HDI2"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	SET WINDOW TITLE(Get window title(Current form window); $window)
	DIALOG("HDI2"; Form; *)
	
End if 
