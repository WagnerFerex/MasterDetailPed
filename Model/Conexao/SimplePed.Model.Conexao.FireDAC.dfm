object DMFireDAC: TDMFireDAC
  OldCreateOrder = False
  Height = 338
  Width = 421
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=..\..\DB\SimplePed.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 208
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 232
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 216
    Top = 240
  end
end
