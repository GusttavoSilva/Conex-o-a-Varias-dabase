object DM: TDM
  OldCreateOrder = False
  Height = 202
  Width = 269
  object FDCon: TFDConnection
    Params.Strings = (
      'Server=teste'
      'DriverID=MSSQL')
    Transaction = FDTransaction1
    Left = 31
    Top = 14
  end
  object FDTransaction1: TFDTransaction
    Connection = FDCon
    Left = 48
    Top = 128
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    ODBCDriver = 'SQL Server'
    Left = 136
    Top = 16
  end
  object FDPhysODBCDriverLink1: TFDPhysODBCDriverLink
    Left = 56
    Top = 72
  end
end
