object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 437
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 437
    Align = alClient
    TabOrder = 0
    object pnlSobre: TPanel
      Left = 168
      Top = 120
      Width = 225
      Height = 153
      BevelInner = bvRaised
      BevelKind = bkFlat
      TabOrder = 0
      VerticalAlignment = taAlignTop
      Visible = False
      object btnFechar: TButton
        Left = 2
        Top = 122
        Width = 217
        Height = 25
        Align = alBottom
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = btnFecharClick
      end
      object mmSobre: TMemo
        Left = 2
        Top = 2
        Width = 217
        Height = 120
        Align = alClient
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 272
    object Vendas1: TMenuItem
      Caption = 'Vendas'
      object Pedidos1: TMenuItem
        Action = actPedidos
      end
    end
    object Sobre1: TMenuItem
      Action = actSobre
    end
  end
  object ActionList1: TActionList
    Left = 288
    Top = 272
    object actSobre: TAction
      Caption = '&Sobre'
      OnExecute = actSobreExecute
    end
    object actPedidos: TAction
      Caption = '&Pedidos'
      OnExecute = actPedidosExecute
    end
  end
end
