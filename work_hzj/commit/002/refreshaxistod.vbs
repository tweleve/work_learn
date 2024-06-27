' Copyright 2019 Fangling Software Co., Ltd. All Rights Reserved.
' Author: mengqiliang@fLcnc.com (Mengqi Liang)

Include "C:/FangLing/tube2/utility/upgrade_scripts/UtilityFunction.vbs"

' Every patch must modify this constant and PatchDiff function
TO_VERSION = "0000"
FORCE_CHANGE = true

sub PatchDiff()
 ' Modbus
  parent = "/*/TubeTechParam/TubeBus/ModbusMaster/ModbusMasterItem"
  if ExistElement(parent & "[@ModbusDeviceName='192.168.1.88']") then
    RemoveElement(parent)
  end if

  parent = "/*/TubeTechParam/TubeBus"
  if not ExistElement(parent & "/ModbusMaster") then
    AppendElement parent, "ModbusMaster"
  end if

  set new_element = PrependElement("/*/TubeTechParam/TubeBus/ModbusMaster", "ModbusMasterItem")
  SetAttribute new_element, "ModbusMasterItemType", "1"
  SetAttribute new_element, "ModbusDeviceName", "192.168.1.88"
  SetAttribute new_element, "ModbusDeviceArgument", "502"
  SetAttribute new_element, "ModbusDeviceArgument__DisplayName", "port"

  set new_element = AppendElement("/*/TubeTechParam/TubeBus/ModbusMaster/ModbusMasterItem", "ModBusMasterRegMap")
  SetAttribute new_element, "TargetSlaveId", "1"
  SetAttribute new_element, "EndianType", "0"
  SetAttribute new_element, "DReadSize", "0"
  SetAttribute new_element, "DWriteReadSize", "20"
  SetAttribute new_element, "MReadSize", "0"
  SetAttribute new_element, "MWriteReadSize", "0"

  parent = "/*/TubeTechParam/TubeBus/ModbusMaster/ModbusMasterItem/ModBusMasterRegMap"  & "[@TargetSlaveId='1']"

  ' X
  set new_element = AppendElement(parent, "RegisterMap")
  SetAttribute new_element, "CNCRegValue", ""
  SetAttribute new_element, "CNCRegValueType", "5"
  SetAttribute new_element, "CNCRegValueType__Privilege", "0"
  SetAttribute new_element, "CNCReg", "427"
  SetAttribute new_element, "CNCRegType", "1"
  SetAttribute new_element, "ModBusRegType", "1"
  SetAttribute new_element, "ModBusReg", "1000"

  ' y
  set new_element = AppendElement(parent, "RegisterMap")
  SetAttribute new_element, "CNCRegValue", ""
  SetAttribute new_element, "CNCRegValueType", "5"
  SetAttribute new_element, "CNCRegValueType__Privilege", "0"
  SetAttribute new_element, "CNCReg", "428"
  SetAttribute new_element, "CNCRegType", "1"
  SetAttribute new_element, "ModBusRegType", "1"
  SetAttribute new_element, "ModBusReg", "1002"

  
  CopyFolderToTarget "data/refreshaxistod", "C:\FangLing\tube2\plugins\script\qml\fixed1"

  TO_VERSION = VERSION_PATCH
end sub

Sub Include(sInstFile)
  Dim oFSO, f, s
  Set oFSO = CreateObject("Scripting.FileSystemObject")
  Set f = oFSO.OpenTextFile(sInstFile)
  s = f.ReadAll
  f.Close
  ExecuteGlobal s
  Set f = Nothing
  Set oFSO = Nothing
End Sub

Main
