//%attributes = {"invisible":true}

C_OBJECT:C1216($oTable; $1; $otmp)

$oTable:=$1

p_Index_kind:=OBJECT Get pointer:C1124(Object named:K67:5; "Index_kind")
p_Index_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Index_name")
p_Index_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "Index_uuid")
p_Index_type:=OBJECT Get pointer:C1124(Object named:K67:5; "Index_type")
p_Index_unique_keys:=OBJECT Get pointer:C1124(Object named:K67:5; "Index_unique_keys")

p_Index_kind->:=OB Get:C1224($oTable; "kind")
p_Index_name->:=OB Get:C1224($oTable; "name")
p_Index_uuid->:=OB Get:C1224($oTable; "uuid")


C_TEXT:C284($tmpVal)
$tmpVal:=OB Get:C1224($oTable; "type")
Case of 
	: ($tmpVal="1")
		p_Index_type->:="B-tree"
	: ($tmpVal="3")
		p_Index_type->:="Cluster B-tree"
	: ($tmpVal="7")
		p_Index_type->:="Automatic"
	Else 
		p_Index_type->:=$tmpVal
End case 


$Tmp:=OB Get:C1224($oTable; "unique_keys")
If (($Tmp="") | ($Tmp="False"))
	p_Index_unique_keys->:=0
Else 
	p_Index_unique_keys->:=1
End if 

ARRAY OBJECT:C1221($arrField; 0)
OB GET ARRAY:C1229($oTable; "field"; $arrField)

$size:=Size of array:C274($arrField)

p_index_field_name:=OBJECT Get pointer:C1124(Object named:K67:5; "index_field_name")
p_index_field_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "index_field_uuid")
p_index_table_name:=OBJECT Get pointer:C1124(Object named:K67:5; "index_table_name")
p_index_table_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "index_table_uuid")

ARRAY TEXT:C222(p_index_field_name->; $size)
ARRAY TEXT:C222(p_index_field_uuid->; $size)
ARRAY TEXT:C222(p_index_table_name->; $size)
ARRAY TEXT:C222(p_index_table_uuid->; $size)

For ($i; 1; $size)
	p_index_field_name->{$i}:=OB Get:C1224($arrField{$i}; "name")
	p_index_field_uuid->{$i}:=OB Get:C1224($arrField{$i}; "uuid")
	p_index_table_name->{$i}:=OB Get:C1224($arrField{$i}; "table_name")
	p_index_table_uuid->{$i}:=OB Get:C1224($arrField{$i}; "table_uuid")
End for 