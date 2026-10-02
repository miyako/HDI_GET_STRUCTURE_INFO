//%attributes = {"invisible":true}
// resolves the theme-dependent colours defined in styleSheets.css for the hidden "refListColors" rectangle
#DECLARE->$colors : Object

var $foreground; $background : Integer
OBJECT GET RGB COLORS(*; "refListColors"; $foreground; $background)

$colors:=New object("foreground"; $foreground; "background"; $background)
