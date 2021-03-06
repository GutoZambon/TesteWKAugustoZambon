object frmPeido: TfrmPeido
  Left = 0
  Top = 0
  Caption = 'Peidos'
  ClientHeight = 426
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 426
    Align = alLeft
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 1
      Top = 1
      Width = 127
      Height = 22
      Action = actIncluir
      Align = alTop
      ExplicitLeft = 24
      ExplicitTop = 64
      ExplicitWidth = 23
    end
    object SpeedButton2: TSpeedButton
      Left = 1
      Top = 45
      Width = 127
      Height = 22
      Action = actGravar
      Align = alTop
      ExplicitLeft = 40
      ExplicitTop = 48
      ExplicitWidth = 23
    end
    object SpeedButton3: TSpeedButton
      Left = 1
      Top = 67
      Width = 127
      Height = 22
      Action = actPesquisar
      Align = alTop
      ExplicitLeft = 64
      ExplicitTop = 96
      ExplicitWidth = 23
    end
    object SpeedButton4: TSpeedButton
      Left = 1
      Top = 89
      Width = 127
      Height = 22
      Action = actCancelarPedido
      Align = alTop
      ExplicitLeft = 8
      ExplicitTop = 80
      ExplicitWidth = 23
    end
    object SpeedButton5: TSpeedButton
      Left = 1
      Top = 23
      Width = 127
      Height = 22
      Action = actCancelar
      Align = alTop
      OnClick = SpeedButton5Click
      ExplicitTop = 17
    end
    object SpeedButton6: TSpeedButton
      Left = 1
      Top = 111
      Width = 127
      Height = 22
      Action = actAtualizar
      Align = alTop
      Visible = False
      ExplicitLeft = 40
      ExplicitTop = 184
      ExplicitWidth = 23
    end
  end
  object Panel2: TPanel
    Left = 129
    Top = 0
    Width = 551
    Height = 426
    Align = alClient
    TabOrder = 1
    object pgcFundo: TPageControl
      Left = 1
      Top = 1
      Width = 549
      Height = 424
      ActivePage = tbManutencao
      Align = alClient
      TabOrder = 0
      object tbManutencao: TTabSheet
        Caption = 'Manuten'#231#227'o'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 541
          Height = 396
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 34
            Top = 40
            Width = 40
            Height = 13
            Caption = 'Cliente :'
          end
          object Label2: TLabel
            Left = 35
            Top = 68
            Width = 39
            Height = 13
            Caption = 'Prduto :'
          end
          object Label3: TLabel
            Left = 11
            Top = 95
            Width = 63
            Height = 13
            Caption = 'Quantidade :'
          end
          object Label4: TLabel
            Left = 192
            Top = 95
            Width = 68
            Height = 13
            Caption = 'Valor Unit'#225'rio:'
          end
          object Label5: TLabel
            Left = 43
            Top = 122
            Width = 31
            Height = 13
            Caption = 'Total :'
          end
          object Label7: TLabel
            Left = 35
            Top = 10
            Width = 39
            Height = 13
            Caption = 'Pedido :'
          end
          object SpeedButton7: TSpeedButton
            Left = 248
            Top = 119
            Width = 89
            Height = 22
            Action = actIncluirProduto
          end
          object DBGrid2: TDBGrid
            Left = 1
            Top = 159
            Width = 539
            Height = 195
            Align = alBottom
            DataSource = dsItens
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object edtSEQ_CLIENTE: TDBLookupComboBox
            Left = 80
            Top = 36
            Width = 275
            Height = 21
            DataField = 'ID_CLIENTE'
            DataSource = dsPrincipal
            KeyField = 'SEQ_CLIENTE'
            ListField = 'DS_CLIENTE'
            ListSource = dsCliente
            TabOrder = 1
          end
          object Panel4: TPanel
            Left = 1
            Top = 354
            Width = 539
            Height = 41
            Align = alBottom
            TabOrder = 4
            object Label6: TLabel
              Left = 297
              Top = 10
              Width = 66
              Height = 13
              Caption = 'Total Pedido :'
            end
            object edtVR_TOTAL: TDBEdit
              Left = 384
              Top = 6
              Width = 121
              Height = 21
              DataField = 'VR_TOTAL'
              DataSource = dsPrincipal
              TabOrder = 0
            end
          end
          object edtSEQ_PEDIDO: TDBEdit
            Left = 80
            Top = 6
            Width = 121
            Height = 21
            DataField = 'SEQ_PEDIDO'
            DataSource = dsPrincipal
            Enabled = False
            TabOrder = 0
          end
          object edtID_PRODUTO: TDBLookupComboBox
            Left = 80
            Top = 63
            Width = 276
            Height = 21
            DataField = 'ID_PRODUTO'
            KeyField = 'SEQ_PRODUTO'
            ListField = 'DS_PRODUTO'
            ListSource = dsProduto
            TabOrder = 2
            OnExit = edtID_PRODUTOExit
          end
          object edtVrUnitario: TMaskEdit
            Left = 266
            Top = 92
            Width = 80
            Height = 21
            TabOrder = 5
            Text = ''
            OnKeyPress = edtVrUnitarioKeyPress
          end
          object edtQuantidade: TMaskEdit
            Left = 80
            Top = 90
            Width = 62
            Height = 21
            TabOrder = 6
            Text = ''
            OnChange = edtQuantidadeChange
            OnKeyPress = edtQuantidadeKeyPress
          end
          object edtTotal: TMaskEdit
            Left = 80
            Top = 118
            Width = 95
            Height = 21
            Enabled = False
            TabOrder = 7
            Text = ''
          end
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 144
    object actIncluir: TAction
      Caption = '&Incluir'
      OnExecute = actIncluirExecute
    end
    object actGravar: TAction
      Caption = '&Gravar'
      OnExecute = actGravarExecute
    end
    object actPesquisar: TAction
      Caption = '&Pesquisar'
      OnExecute = actPesquisarExecute
    end
    object actCancelarPedido: TAction
      Caption = 'Cancela&r Pedido'
      OnExecute = actCancelarPedidoExecute
    end
    object actCancelar: TAction
      Caption = '&Cancelar'
      OnExecute = actCancelarExecute
    end
    object actAtualizar: TAction
      Caption = '&Atualizar'
      OnExecute = actAtualizarExecute
    end
    object actIncluirProduto: TAction
      Caption = 'Adicionar Item'
      OnExecute = actIncluirProdutoExecute
    end
  end
  object dsPrincipal: TDataSource
    DataSet = qryPedido
    Left = 40
    Top = 280
  end
  object qryPedido: TFDQuery
    BeforePost = qryPedidoBeforePost
    Connection = dmPrincipal.cnnPrincipal
    UpdateObject = updtPedido
    SQL.Strings = (
      'select '
      '    PEDIDOS.SEQ_PEDIDO,'
      '    PEDIDOS.DT_PEDIDO,'
      '    PEDIDOS.ID_CLIENTE,'
      '    PEDIDOS.VR_TOTAL,'
      '    CLIENTES.DS_CLIENTE,'
      '    CLIENTES.DS_CIDADE,'
      '    CLIENTES.DS_UF'
      'FROM PEDIDOS'
      'LEFT JOIN CLIENTES ON PEDIDOS.ID_CLIENTE = CLIENTES.SEQ_CLIENTE'
      'where PEDIDOS.SEQ_PEDIDO = :P_SEQ_PEDIDO')
    Left = 88
    Top = 280
    ParamData = <
      item
        Name = 'P_SEQ_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPedidoSEQ_PEDIDO: TFDAutoIncField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'SEQ_PEDIDO'
      Origin = 'SEQ_PEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPedidoDT_PEDIDO: TDateTimeField
      DisplayLabel = 'Data Pedido'
      FieldName = 'DT_PEDIDO'
      Origin = 'DT_PEDIDO'
    end
    object qryPedidoID_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryPedidoVR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VR_TOTAL'
      Origin = 'VR_TOTAL'
      Precision = 16
      Size = 2
    end
    object qryPedidoDS_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'DS_CLIENTE'
      Origin = 'DS_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryPedidoDS_CIDADE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade'
      FieldName = 'DS_CIDADE'
      Origin = 'DS_CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPedidoDS_UF: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'UF'
      FieldName = 'DS_UF'
      Origin = 'DS_UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
  object qryItens: TFDQuery
    BeforePost = qryItensBeforePost
    IndexFieldNames = 'ID_PEDIDO'
    MasterSource = dsPrincipal
    MasterFields = 'SEQ_PEDIDO'
    DetailFields = 'ID_PEDIDO'
    Connection = dmPrincipal.cnnPrincipal
    FetchOptions.AssignedValues = [evCache]
    UpdateObject = updtItens
    SQL.Strings = (
      'select '
      '    ITENS_PEDIDO.SEQ_ITEM_PEDIDO,'
      '    ITENS_PEDIDO.ID_PEDIDO,'
      '    ITENS_PEDIDO.DT_ATUALIZACAO,'
      '    ITENS_PEDIDO.ID_PRODUTO,'
      '    PRODUTOS.DS_PRODUTO,'
      '    ITENS_PEDIDO. QT_PRODUTO,'
      '    ITENS_PEDIDO.VR_UNITARIO,'
      '    ITENS_PEDIDO.VR_TOTAL'
      '  '
      'FROM ITENS_PEDIDO'
      
        'LEFT JOIN PRODUTOS ON ITENS_PEDIDO.ID_PRODUTO = PRODUTOS.SEQ_PRO' +
        'DUTO'
      'WHERE ITENS_PEDIDO.ID_PEDIDO = :SEQ_PEDIDO'
      '    ')
    Left = 88
    Top = 352
    ParamData = <
      item
        Name = 'SEQ_PEDIDO'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = Null
      end>
    object qryItensSEQ_ITEM_PEDIDO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo Item Pedido'
      FieldName = 'SEQ_ITEM_PEDIDO'
      Origin = 'SEQ_ITEM_PEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryItensID_PEDIDO: TIntegerField
      DisplayLabel = 'N'#250'mero Pedido'
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
    end
    object qryItensDT_ATUALIZACAO: TDateTimeField
      DisplayLabel = 'Data Altera'#231#227'o'
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object qryItensID_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object qryItensDS_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      FieldName = 'DS_PRODUTO'
      Origin = 'DS_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItensQT_PRODUTO: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_PRODUTO'
      Origin = 'QT_PRODUTO'
      Precision = 16
      Size = 2
    end
    object qryItensVR_UNITARIO: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VR_UNITARIO'
      Origin = 'VR_UNITARIO'
      Precision = 16
      Size = 2
    end
    object qryItensvr_total: TLargeintField
      DisplayLabel = 'Total Item'
      FieldName = 'vr_total'
      Origin = 'vr_total'
    end
  end
  object updtPedido: TFDUpdateSQL
    Left = 136
    Top = 280
  end
  object updtItens: TFDUpdateSQL
    Left = 142
    Top = 353
  end
  object dsItens: TDataSource
    DataSet = qryItens
    Left = 40
    Top = 352
  end
  object qryCliente: TFDQuery
    Connection = dmPrincipal.cnnPrincipal
    SQL.Strings = (
      'select '
      '    CLIENTES.SEQ_CLIENTE,'
      '    CLIENTES.DS_CLIENTE'
      'FROM CLIENTES    ')
    Left = 582
    Top = 41
    object qryClienteSEQ_CLIENTE: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SEQ_CLIENTE'
      Origin = 'SEQ_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClienteDS_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'DS_CLIENTE'
      Origin = 'DS_CLIENTE'
      Size = 200
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 518
    Top = 41
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 518
    Top = 105
  end
  object qryProduto: TFDQuery
    Connection = dmPrincipal.cnnPrincipal
    SQL.Strings = (
      'select '
      '    PRODUTOS.SEQ_PRODUTO,'
      '    PRODUTOS.DS_PRODUTO,'
      '    PRODUTOS.VR_VENDA'
      'FROM PRODUTOS')
    Left = 582
    Top = 105
    object qryProdutoSEQ_PRODUTO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SEQ_PRODUTO'
      Origin = 'SEQ_PRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryProdutoDS_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'DS_PRODUTO'
      Origin = 'DS_PRODUTO'
      Size = 100
    end
    object qryProdutoVR_VENDA: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VR_VENDA'
      Origin = 'VR_VENDA'
      Precision = 15
      Size = 2
    end
  end
end
