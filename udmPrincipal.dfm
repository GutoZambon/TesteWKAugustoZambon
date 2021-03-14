object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 341
  Width = 511
  object cnnPrincipal: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\donza\OneDrive\Documents\TesteWKAugustoZambon\' +
        'Banco\WK.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 104
    Top = 176
  end
  object FDTransaction1: TFDTransaction
    Connection = cnnPrincipal
    Left = 224
    Top = 192
  end
end
