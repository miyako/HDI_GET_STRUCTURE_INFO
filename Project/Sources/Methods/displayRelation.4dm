//%attributes = {"invisible":true}
C_OBJECT:C1216($oTable; $1; $otmp)

$oTable:=$1

If (OB Is defined:C1231($oTable; "color")=True:C214)
	$otmp:=OB Get:C1224($oTable; "color")
	$color:=(OB Get:C1224($otmp; "red"; Is longint:K8:6) << 16)+(OB Get:C1224($otmp; "green"; Is longint:K8:6) << 8)+OB Get:C1224($otmp; "blue"; Is longint:K8:6)
	OBJECT SET RGB COLORS:C628(*; "LbRelation"; 0; $color)
Else 
	OBJECT SET RGB COLORS:C628(*; "LbRelation"; 0; 0x00FFFFFF)
End if 


p_Relation_name_Nto1:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_name_Nto1")
p_Relation_name_1toN:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_name_1toN")
p_Relation_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_uuid")
p_Relation_integrity:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_integrity")
p_Relation_choice_field:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_choice_field")
p_Relation_auto_load_Nto1:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_auto_load_Nto1")
p_Relation_auto_load_1toN:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_auto_load_1toN")
p_Relation_entry_wildchar:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_entry_wildchar")
p_Relation_entry_create:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_entry_create")
p_Relation_entry_autofill:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_entry_autofill")



p_Relation_name_Nto1->:=OB Get:C1224($oTable; "name_Nto1")
p_Relation_name_1toN->:=OB Get:C1224($oTable; "name_1toN")
p_Relation_uuid->:=OB Get:C1224($oTable; "uuid")

If (OB Is defined:C1231($oTable; "integrity")=True:C214)
	p_Relation_integrity->:=OB Get:C1224($oTable; "integrity")
Else 
	p_Relation_integrity->:="none"
End if 

p_Relation_choice_field->:=OB Get:C1224($oTable; "choice_field")

$Tmp:=OB Get:C1224($oTable; "auto_load_Nto1")
If (($Tmp="") | ($Tmp="False"))
	p_Relation_auto_load_Nto1->:=0
Else 
	p_Relation_auto_load_Nto1->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "auto_load_1toN")
If (($Tmp="") | ($Tmp="False"))
	p_Relation_auto_load_1toN->:=0
Else 
	p_Relation_auto_load_1toN->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "entry_wildchar")
If (($Tmp="") | ($Tmp="False"))
	p_Relation_entry_wildchar->:=0
Else 
	p_Relation_entry_wildchar->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "entry_create")
If (($Tmp="") | ($Tmp="False"))
	p_Relation_entry_create->:=0
Else 
	p_Relation_entry_create->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "entry_autofill")
If (($Tmp="") | ($Tmp="False"))
	p_Relation_entry_autofill->:=0
Else 
	p_Relation_entry_autofill->:=1
End if 

ARRAY OBJECT:C1221($arrField; 0)
OB GET ARRAY:C1229($oTable; "related_field"; $arrField)

$size:=Size of array:C274($arrField)

p_Relation_kind:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_kind")
p_Relation_field_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_field_name")
p_Relation_field_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_field_uuid")
p_Relation_table_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_table_name")
p_Relation_table_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "Relation_table_uuid")

ARRAY TEXT:C222(p_Relation_kind->; $size)
ARRAY TEXT:C222(p_Relation_field_name->; $size)
ARRAY TEXT:C222(p_Relation_field_uuid->; $size)
ARRAY TEXT:C222(p_Relation_table_name->; $size)
ARRAY TEXT:C222(p_Relation_table_uuid->; $size)

For ($i; 1; $size)
	p_Relation_kind->{$i}:=OB Get:C1224($arrField{$i}; "kind")
	p_Relation_field_name->{$i}:=OB Get:C1224($arrField{$i}; "name")
	p_Relation_field_uuid->{$i}:=OB Get:C1224($arrField{$i}; "uuid")
	p_Relation_table_name->{$i}:=OB Get:C1224($arrField{$i}; "table_name")
	p_Relation_table_uuid->{$i}:=OB Get:C1224($arrField{$i}; "table_uuid")
End for 


