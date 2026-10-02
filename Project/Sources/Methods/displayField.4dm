//%attributes = {"invisible":true}
#DECLARE($oTable : Object)
var $tmpVal : Text
ARRAY OBJECT:C1221($arrField; 0)
OB GET ARRAY:C1229($oTable; "Field"; $arrField)

$size:=Size of array:C274($arrField)

p_Field_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_name")
p_Field_ID:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_ID")
p_Field_type:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_type")
p_Field_type_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_type_name")
p_Field_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_uuid")
p_Field_pk:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_pk")
p_Field_indexed:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_indexed")
p_Field_limiting_length:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_limiting_length")
p_Field_unique:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_unique")
p_Field_autosequence:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_autosequence")
p_Field_not_null:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_not_null")
p_Field_never_null:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_never_null")
p_Field_text_switch_size:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_text_switch_size")
p_Field_blob_switch_size:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_blob_switch_size")
p_Field_autogenerate:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_autogenerate")
p_Field_hide_in_REST:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_hide_in_REST")
p_Field_visible:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_visible")
p_Field_enterable:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_enterable")
p_Field_modifiable:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_modifiable")
p_Field_mandatory:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_mandatory")
p_Field_multi_line:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_multi_line")
p_Field_compressed:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_compressed")
p_Field_enumeration_id:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_enumeration_id")
p_Field_enumeration_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_enumeration_name")
p_Field_position:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_position")
p_Field_comment:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_comment")
p_Field_tip:=OBJECT Get pointer:C1124(Object named:K67:5; "Field_tip")


ARRAY TEXT:C222(p_Field_name->; $size)
ARRAY TEXT:C222(p_Field_ID->; $size)
ARRAY TEXT:C222(p_Field_type->; $size)
ARRAY TEXT:C222(p_Field_type_name->; $size)
ARRAY TEXT:C222(p_Field_uuid->; $size)
ARRAY TEXT:C222(p_Field_pk->; $size)
ARRAY TEXT:C222(p_Field_indexed->; $size)
ARRAY TEXT:C222(p_Field_limiting_length->; $size)
ARRAY TEXT:C222(p_Field_unique->; $size)
ARRAY TEXT:C222(p_Field_autosequence->; $size)
ARRAY TEXT:C222(p_Field_not_null->; $size)
ARRAY TEXT:C222(p_Field_never_null->; $size)
ARRAY TEXT:C222(p_Field_text_switch_size->; $size)
ARRAY TEXT:C222(p_Field_blob_switch_size->; $size)
ARRAY TEXT:C222(p_Field_autogenerate->; $size)
ARRAY TEXT:C222(p_Field_hide_in_REST->; $size)
ARRAY TEXT:C222(p_Field_visible->; $size)
ARRAY TEXT:C222(p_Field_enterable->; $size)
ARRAY TEXT:C222(p_Field_modifiable->; $size)
ARRAY TEXT:C222(p_Field_mandatory->; $size)
ARRAY TEXT:C222(p_Field_multi_line->; $size)
ARRAY TEXT:C222(p_Field_compressed->; $size)
ARRAY TEXT:C222(p_Field_enumeration_id->; $size)
ARRAY TEXT:C222(p_Field_enumeration_name->; $size)
ARRAY TEXT:C222(p_Field_position->; $size)
ARRAY TEXT:C222(p_Field_comment->; $size)
ARRAY TEXT:C222(p_Field_tip->; $size)



var $colors : Object
$colors:=getListColors

For ($i; 1; $size)
	
	var $otmp : Object
	
	If (OB Is defined:C1231($arrField{$i}; "color")=True:C214)
		$otmp:=OB Get:C1224($arrField{$i}; "color")
		$color:=(OB Get:C1224($otmp; "red"; Is longint:K8:6) << 16)+(OB Get:C1224($otmp; "green"; Is longint:K8:6) << 8)+OB Get:C1224($otmp; "blue"; Is longint:K8:6)
		LISTBOX SET ROW COLOR:C1270(*; "LbTable"; $i; $color; lk font color:K53:24)
	Else 
		LISTBOX SET ROW COLOR:C1270(*; "LbTable"; $i; $colors.foreground; lk font color:K53:24)
	End if 
	
	p_Field_name->{$i}:=OB Get:C1224($arrField{$i}; "name")
	p_Field_ID->{$i}:=OB Get:C1224($arrField{$i}; "id")
	
	$tmpVal:=OB Get:C1224($arrField{$i}; "type")
	p_Field_type->{$i}:=$tmpVal
	Case of 
		: ($tmpVal="1")
			p_Field_type_name->{$i}:="Boolean"
		: ($tmpVal="3")
			p_Field_type_name->{$i}:="Integer"
		: ($tmpVal="4")
			p_Field_type_name->{$i}:="Long integer"
		: ($tmpVal="5")
			p_Field_type_name->{$i}:="Integer 64-bits"
		: ($tmpVal="6")
			p_Field_type_name->{$i}:="Real"
		: ($tmpVal="7")
			p_Field_type_name->{$i}:="Float"
		: ($tmpVal="8")
			p_Field_type_name->{$i}:="Date"
		: ($tmpVal="9")
			p_Field_type_name->{$i}:="Time"
		: ($tmpVal="10")
			p_Field_type_name->{$i}:="Text"
		: ($tmpVal="12")
			p_Field_type_name->{$i}:="Picture"
		: ($tmpVal="15")
			p_Field_Type_name->{$i}:="Subtable (deprecated type)"
		: ($tmpVal="18")
			p_Field_type_name->{$i}:="Blob"
		: ($tmpVal="21")
			p_Field_type_name->{$i}:="Object"
	End case 
	
	p_Field_uuid->{$i}:=OB Get:C1224($arrField{$i}; "uuid")
	
	If (OB Is defined:C1231($arrField{$i}; "pk")=True:C214)
		p_Field_pk->{$i}:="true"
	Else 
		p_Field_pk->{$i}:="false"
	End if 
	
	If (OB Is defined:C1231($arrField{$i}; "index_ref")=True:C214)
		p_Field_indexed->{$i}:="true"
	Else 
		p_Field_indexed->{$i}:="false"
	End if 
	
	p_Field_limiting_length->{$i}:=OB Get:C1224($arrField{$i}; "limiting_length")
	
	$Tmp:=OB Get:C1224($arrField{$i}; "unique")
	If ($Tmp="")
		p_Field_unique->{$i}:="false"
	Else 
		p_Field_unique->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "autosequence")
	If ($Tmp="")
		p_Field_autosequence->{$i}:="false"
	Else 
		p_Field_autosequence->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "not_null")
	If ($Tmp="")
		p_Field_not_null->{$i}:="false"
	Else 
		p_Field_not_null->{$i}:=$Tmp
	End if 
	
	p_Field_text_switch_size->{$i}:=OB Get:C1224($arrField{$i}; "text_switch_size")
	p_Field_blob_switch_size->{$i}:=OB Get:C1224($arrField{$i}; "blob_switch_size")
	
	$Tmp:=OB Get:C1224($arrField{$i}; "never_null")
	If ($Tmp="")
		p_Field_never_null->{$i}:="false"
	Else 
		p_Field_never_null->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "autogenerate")
	If ($Tmp="")
		p_Field_autogenerate->{$i}:="false"
	Else 
		p_Field_autogenerate->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "hide_in_REST")
	If ($Tmp="")
		p_Field_hide_in_REST->{$i}:="false"
	Else 
		p_Field_hide_in_REST->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "visible")
	If ($Tmp="")
		p_Field_visible->{$i}:="true"
	Else 
		p_Field_visible->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "enterable")
	If ($Tmp="")
		p_Field_enterable->{$i}:="true"
	Else 
		p_Field_enterable->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "modifiable")
	If ($Tmp="")
		p_Field_modifiable->{$i}:="true"
	Else 
		p_Field_modifiable->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "mandatory")
	If ($Tmp="")
		p_Field_mandatory->{$i}:="false"
	Else 
		p_Field_mandatory->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "multi_line")
	If ($Tmp="")
		p_Field_multi_line->{$i}:="default"
	Else 
		p_Field_multi_line->{$i}:=$Tmp
	End if 
	
	$Tmp:=OB Get:C1224($arrField{$i}; "compressed")
	If ($Tmp="")
		p_Field_compressed->{$i}:="false"
	Else 
		p_Field_compressed->{$i}:=OB Get:C1224($arrField{$i}; "compressed")
	End if 
	
	If (OB Is defined:C1231($arrField{$i}; "enumeration_id")=True:C214)
		$tmpVal:=OB Get:C1224($arrField{$i}; "enumeration_id")
		p_Field_enumeration_id->{$i}:=$tmpVal
		If ((Num:C11($tmpVal)<(Size of array:C274(arrChoiceListName)+1)) & (Num:C11($tmpVal)>0))
			p_Field_enumeration_name->{$i}:=arrChoiceListName{Num:C11($tmpVal)}
		End if 
	End if 
	
	p_Field_position->{$i}:=OB Get:C1224($arrField{$i}; "position")
	p_Field_comment->{$i}:=OB Get:C1224($arrField{$i}; "comment")
	p_Field_tip->{$i}:=OB Get:C1224($arrField{$i}; "tip")
End for 
