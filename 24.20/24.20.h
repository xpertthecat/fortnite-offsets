// Dumper-7.h
#ifndef DUMPER7_H
#define DUMPER7_H

#define FUObjectItemSize 0x18
#define ULevel_Actors 0x98
#define UDataTable_RowMap 0x30
#define Text_TextSize 0x18
#define Text_TextDatOffset 0x0
#define Text_InTextDataStringOffset 0x30

#define UObject_Flags 0x8
#define UObject_Index 0xC
#define UObject_Class 0x10
#define UObject_Name 0x18
#define UObject_Outer 0x20
#define UField_Next 0x28
#define UStruct_Children 0x48
#define UStruct_SuperStruct 0x40
#define UStruct_Size 0x58
#define UStruct_MinAlignment 0x5C
#define UStruct_ChildProperties 0x50
#define UClass_CastFlags 0xD8
#define UClass_ClassDefaultObject 0x110
#define UClass_ImplementedInterfaces 0x1D0
#define UEnum_Names 0x40
#define UFunction_FunctionFlags 0xB0
#define UFunction_ExecFunction 0xD8
#define Property_ArrayDim 0x30
#define Property_ElementSize 0x34
#define Property_PropertyFlags 0x38
#define Property_Offset_Internal 0x44
#define FField_Class 0x8
#define FField_Next 0x20
#define FField_Name 0x28
#define FField_Flags 0x2C
#define Base_UBoolProperty 0x70
#define Base_EnumProperty 0x70
#define ObjectProperty_PropertyClass 0x70
#define ByteProperty_Enum 0x70
#define StructProperty_Struct 0x70
#define DelegateProperty_SignatureFunction 0x70
#define ArrayProperty_Inner 0x70
#define SetProperty_ElementProp 0x70
#define MapProperty_Base 0x70

#define GObjects 0x105F0AE8
#define GNames 0x10800440
#define GWorld 0x1078A7D8
#define FName_AppendString 0xFB3898
#define PE_Offset 0xF86384
#define PE_Index 0x4D
#define bIsObjPtrInsteadOfFieldPathProperty false
#define bUseUint8ArrayDim false

#endif
