#pragma once

namespace Off
{
    namespace InSDK
    {
        namespace ObjArray
        {
            constexpr auto FUObjectItemSize = 0x18;
        }

        namespace ULevel
        {
            constexpr auto Actors = 0x98;
        }

        namespace UDataTable
        {
            constexpr auto RowMap = 0x30;
        }

        namespace Text
        {
            constexpr auto TextSize = 0x18;
            constexpr auto TextDatOffset = 0x0;
            constexpr auto InTextDataStringOffset = 0x30;
        }
    }

    namespace UObject
    {
        constexpr auto Flags = 0x8;
        constexpr auto Index = 0xC;
        constexpr auto Class = 0x10;
        constexpr auto Name = 0x18;
        constexpr auto Outer = 0x20;
    }

    namespace UField
    {
        constexpr auto Next = 0x28;
    }

    namespace UStruct
    {
        constexpr auto Children = 0x48;
        constexpr auto SuperStruct = 0x40;
        constexpr auto Size = 0x58;
        constexpr auto MinAlignment = 0x5C;
        constexpr auto ChildProperties = 0x50;
    }

    namespace UClass
    {
        constexpr auto CastFlags = 0xD8;
        constexpr auto ClassDefaultObject = 0x110;
        constexpr auto ImplementedInterfaces = 0x1D0;
    }

    namespace UEnum
    {
        constexpr auto Names = 0x40;
    }

    namespace UFunction
    {
        constexpr auto FunctionFlags = 0xB0;
        constexpr auto ExecFunction = 0xD8;
    }

    namespace Property
    {
        constexpr auto ArrayDim = 0x30;
        constexpr auto ElementSize = 0x34;
        constexpr auto PropertyFlags = 0x38;
        constexpr auto Offset_Internal = 0x44;
    }

    namespace FField
    {
        constexpr auto Class = 0x8;
        constexpr auto Next = 0x20;
        constexpr auto Name = 0x28;
        constexpr auto Flags = 0x2C;
    }

    namespace UBoolProperty
    {
        constexpr auto Base = 0x70;
    }

    namespace EnumProperty
    {
        constexpr auto Base = 0x70;
    }

    namespace ObjectProperty
    {
        constexpr auto PropertyClass = 0x70;
    }

    namespace ByteProperty
    {
        constexpr auto Enum = 0x70;
    }

    namespace StructProperty
    {
        constexpr auto Struct = 0x70;
    }

    namespace DelegateProperty
    {
        constexpr auto SignatureFunction = 0x70;
    }

    namespace ArrayProperty
    {
        constexpr auto Inner = 0x70;
    }

    namespace SetProperty
    {
        constexpr auto ElementProp = 0x70;
    }

    namespace MapProperty
    {
        constexpr auto Base = 0x70;
    }
}

// Global Offsets
namespace Globals
{
    constexpr auto GObjects = 0x105F0AE8;
    constexpr auto GNames = 0x10800440;
    constexpr auto GWorld = 0x1078A7D8;

    constexpr auto FName_AppendString = 0xFB3898;

    constexpr auto PE_Offset = 0xF86384;
    constexpr auto PE_Index  = 0x4D;

    constexpr bool bIsObjPtrInsteadOfFieldPathProperty = false;
    constexpr bool bUseUint8ArrayDim = false;
}
