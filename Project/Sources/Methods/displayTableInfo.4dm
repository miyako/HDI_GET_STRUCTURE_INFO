//%attributes = {"invisible":true}
C_OBJECT:C1216($oTable; $1; $otmp)

$oTable:=$1

If (OB Is defined:C1231($oTable; "color")=True:C214)
	$otmp:=OB Get:C1224($oTable; "color")
	$color:=(OB Get:C1224($otmp; "red"; Is longint:K8:6) << 16)+(OB Get:C1224($otmp; "green"; Is longint:K8:6) << 8)+OB Get:C1224($otmp; "blue"; Is longint:K8:6)
	OBJECT SET RGB COLORS:C628(*; "LbTable"; 0; $color)
Else 
	OBJECT SET RGB COLORS:C628(*; "LbTable"; 0; 0x00FFFFFF)
End if 

p_Table_id:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_id")
p_Table_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_name")
p_Table_uuid:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_uuid")
p_Table_sql_schema_id:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_sql_schema_id")
p_Table_sql_schema_name:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_sql_schema_name")
p_Table_comment:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_comment")
p_leave_tag_on_delete:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_leave_tag_on_delete")
p_keep_record_sync_info:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_keep_record_sync_info")
p_hide_in_REST:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_hide_in_REST")
p_prevent_journaling:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_prevent_journaling")
p_visible:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_visible")
p_trigger_insert:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_trigger_insert")
p_trigger_delete:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_trigger_delete")
p_trigger_update:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_trigger_update")
p_trashed:=OBJECT Get pointer:C1124(Object named:K67:5; "Table_trashed")



p_Table_id->:=OB Get:C1224($oTable; "id")
p_Table_name->:=OB Get:C1224($oTable; "name")
p_Table_uuid->:=OB Get:C1224($oTable; "uuid")
p_Table_sql_schema_id->:=OB Get:C1224($oTable; "sql_schema_id")
p_Table_sql_schema_name->:=OB Get:C1224($oTable; "sql_schema_name")
p_Table_comment->:=OB Get:C1224($oTable; "comment")


$Tmp:=OB Get:C1224($oTable; "leave_tag_on_delete")
If (($Tmp="") | ($Tmp="False"))
	p_Leave_tag_on_delete->:=0
Else 
	p_Leave_tag_on_delete->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "keep_record_sync_info")
If (($Tmp="") | ($Tmp="False"))
	p_keep_record_sync_info->:=0
Else 
	p_keep_record_sync_info->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "hide_in_REST")
If (($Tmp="") | ($Tmp="False"))
	p_hide_in_REST->:=0
Else 
	p_hide_in_REST->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "prevent_journaling")
If (($Tmp="") | ($Tmp="False"))
	p_prevent_journaling->:=0
Else 
	p_prevent_journaling->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "visible")
If (($Tmp="") | ($Tmp="True"))
	p_visible->:=1
Else 
	p_visible->:=0
End if 

$Tmp:=OB Get:C1224($oTable; "trigger_insert")
If (($Tmp="") | ($Tmp="False"))
	p_trigger_insert->:=0
Else 
	p_trigger_insert->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "trigger_delete")
If (($Tmp="") | ($Tmp="False"))
	p_trigger_delete->:=0
Else 
	p_trigger_delete->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "trigger_update")
If (($Tmp="") | ($Tmp="False"))
	p_trigger_update->:=0
Else 
	p_trigger_update->:=1
End if 

$Tmp:=OB Get:C1224($oTable; "trashed")
If (($Tmp="") | ($Tmp="False"))
	p_trashed->:=0
Else 
	p_trashed->:=1
End if 