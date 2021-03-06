unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  udmPrincipal, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;


type
  TfrmPeido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pgcFundo: TPageControl;
    tbManutencao: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ActionList1: TActionList;
    actIncluir: TAction;
    actGravar: TAction;
    actPesquisar: TAction;
    actCancelarPedido: TAction;
    SpeedButton5: TSpeedButton;
    actCancelar: TAction;
    dsPrincipal: TDataSource;
    qryPedido: TFDQuery;
    qryItens: TFDQuery;
    updtPedido: TFDUpdateSQL;
    qryPedidoSEQ_PEDIDO: TFDAutoIncField;
    qryPedidoDT_PEDIDO: TDateTimeField;
    qryPedidoID_CLIENTE: TIntegerField;
    qryPedidoVR_TOTAL: TBCDField;
    qryPedidoDS_CLIENTE: TStringField;
    qryPedidoDS_CIDADE: TStringField;
    qryPedidoDS_UF: TStringField;
    qryItensSEQ_ITEM_PEDIDO: TFDAutoIncField;
    qryItensID_PEDIDO: TIntegerField;
    qryItensDT_ATUALIZACAO: TDateTimeField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensDS_PRODUTO: TStringField;
    qryItensQT_PRODUTO: TBCDField;
    qryItensVR_UNITARIO: TBCDField;
    updtItens: TFDUpdateSQL;
    SpeedButton6: TSpeedButton;
    actAtualizar: TAction;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    edtSEQ_CLIENTE: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    edtVR_TOTAL: TDBEdit;
    Label7: TLabel;
    edtSEQ_PEDIDO: TDBEdit;
    edtID_PRODUTO: TDBLookupComboBox;
    SpeedButton7: TSpeedButton;
    actIncluirProduto: TAction;
    dsItens: TDataSource;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    qryClienteSEQ_CLIENTE: TFDAutoIncField;
    qryClienteDS_CLIENTE: TStringField;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryProdutoSEQ_PRODUTO: TFDAutoIncField;
    qryProdutoDS_PRODUTO: TStringField;
    qryProdutoVR_VENDA: TBCDField;
    edtVrUnitario: TMaskEdit;
    edtQuantidade: TMaskEdit;
    edtTotal: TMaskEdit;
    qryItensvr_total: TLargeintField;
    procedure actAtualizarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure actIncluirProdutoExecute(Sender: TObject);
    procedure qryPedidoBeforePost(DataSet: TDataSet);
    procedure qryItensBeforePost(DataSet: TDataSet);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtID_PRODUTOExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtVrUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actCancelarPedidoExecute(Sender: TObject);
  private
    { Private declarations }

    /// <summary>
    ///   Fun??o que controla a libera??o dos bot?es e abas
    /// </summary>
    procedure HabilitaDesabilitaAciont(aEdicao: Boolean);

    function SomenteNumerosKey(aKey: Char): Char;
  public
    { Public declarations }
  end;

var
  frmPeido: TfrmPeido;

implementation

{$R *.dfm}

{ TfrmPeido }

procedure TfrmPeido.actAtualizarExecute(Sender: TObject);
begin
  qryPedido.Close;
  qryPedido.ParamByName('P_SEQ_PEDIDO').AsInteger := -1;
  qryPedido.Open;

  qryItens.Close;
  qryItens.Open;

  qryProduto.Close;
  qryProduto.Open;

  qryCliente.Close;
  qryCliente.Open;
end;

procedure TfrmPeido.actCancelarExecute(Sender: TObject);
begin
  qryPedido.Cancel;
  HabilitaDesabilitaAciont(False { Edicao });
  actAtualizarExecute(nil);
end;

procedure TfrmPeido.actCancelarPedidoExecute(Sender: TObject);
var
  sPedido: String;
begin
  sPedido := InputBox('Cancelar pedido', 'Informe o n?mero de pedido', '');

  if sPedido = '' then
    exit;

  qryPedido.Close;
  qryPedido.ParamByName('P_SEQ_PEDIDO').AsInteger := StrToIntDef(sPedido, 0);
  qryPedido.Open;

  if qryPedido.RecordCount > 0 then
  begin
    if Application.MessageBox('Confirma o cancelamento deste pedido?', 'Cancelar pedido', MB_OKCANCEL) = ID_OK then
    begin
      qryItens.DisableControls;
      try
        qryItens.First;
        while not qryItens.EOF do
          qryItens.Delete;
      finally
        qryItens.EnableControls;
      end;

      qryPedido.Delete;

      actAtualizarExecute(nil);
    end;
  end
  else
    Application.MessageBox('Pesquisar pedido', 'Pedido n?o encontrado.');
end;

procedure TfrmPeido.actGravarExecute(Sender: TObject);
begin
  if qryItens.RecordCount = 0 then
  begin
    Application.MessageBox('O pedido deve ter ao menos um item.', 'Falha');
    edtID_PRODUTO.SetFocus;

    exit;
  end;

  if qryItens.State in dsEditModes then
    qryItens.Cancel;

  if qrypedido.State in dsEditModes then
    qryPedido.Post;

  qryPedido.Connection.Transaction.Commit;

  HabilitaDesabilitaAciont(False { edicao });
end;

procedure TfrmPeido.actIncluirExecute(Sender: TObject);
begin
  qryPedido.Connection.Transaction.StartTransaction;

  qryPedido.Append;
  qryPedido.post;
  qryPedido.edit;

  HabilitaDesabilitaAciont(True { edicao });
end;

procedure TfrmPeido.actIncluirProdutoExecute(Sender: TObject);
begin
  if edtID_PRODUTO.KeyValue = null then
  begin
    Application.MessageBox('Selecione um produto para incluir.', 'Falha');
    edtID_PRODUTO.SetFocus;
    exit;
  end;

  if StrToFloatDef(edtQuantidade.Text, 0) <= 0 then
  begin
    Application.MessageBox('Informe uma quantidade.', 'Falha');
    edtQuantidade.SetFocus;
    exit;
  end;

  if StrToFloatDef(edtVrUnitario.Text, 0) <= 0 then
  begin
    Application.MessageBox('Informe uma quantidade.', 'Falha');
    edtVrUnitario.SetFocus;
    exit;
  end;

  qryItens.Append;
  qryItensID_PEDIDO.AsInteger := qryPedidoSEQ_PEDIDO.AsInteger;
  qryItensID_PRODUTO.AsInteger := edtID_PRODUTO.KeyValue;
  qryItensVR_UNITARIO.AsFloat := StrToFloatDef(edtVrUnitario.Text, 0);
  qryItensQT_PRODUTO.AsFloat := StrToFloatDef(edtQuantidade.Text, 0);
  qryItensVR_TOTAL.AsFloat := StrToFloatDef(edtTotal.Text, 0);
  qryItens.Post;

  qryPedido.Edit;
  qryPedidoVR_TOTAL.AsFloat := qryPedidoVR_TOTAL.AsFloat + qryItensVR_TOTAL.AsFloat;
  qryPedido.Post;

  edtID_PRODUTO.KeyValue := null;
  edtVrUnitario.Text := '';
  edtQuantidade.Text := '';
  edtTotal.Text := '';

  edtID_PRODUTO.SetFocus;
end;

procedure TfrmPeido.actPesquisarExecute(Sender: TObject);
var
  sPedido: String;
begin
  sPedido := InputBox('Pesquisar pedido', 'Informe o n?mero de pedido', '');

  if sPedido = '' then
    exit;

  qryPedido.Close;
  qryPedido.ParamByName('P_SEQ_PEDIDO').AsInteger := StrToIntDef(sPedido, 0);
  qryPedido.Open;

  if qryPedido.RecordCount > 0 then
  begin
    qryPedido.Connection.Transaction.StartTransaction;

    qryPedido.Edit;
    edtSEQ_CLIENTE.SetFocus;

    HabilitaDesabilitaAciont(True {Edicao });
  end
  else
    Application.MessageBox('Pesquisar pedido', 'Pedido n?o encontrado.');
end;

procedure TfrmPeido.edtID_PRODUTOExit(Sender: TObject);
begin
  edtVrUnitario.Text := FormatFloat('##,##', qryProdutoVR_VENDA.AsFloat);
end;

procedure TfrmPeido.edtQuantidadeChange(Sender: TObject);
begin
  edtTotal.Text :=  FloatToStr(StrToFloatDef(edtVrUnitario.Text, 0) * StrToFloatDef(edtQuantidade.Text, 0));
end;

procedure TfrmPeido.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := SomenteNumerosKey(Key);
end;

procedure TfrmPeido.edtVrUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  Key := SomenteNumerosKey(Key);
end;

procedure TfrmPeido.FormCreate(Sender: TObject);
begin
  actAtualizarExecute(actAtualizar);

  HabilitaDesabilitaAciont(False { edicao });
end;

procedure TfrmPeido.HabilitaDesabilitaAciont(aEdicao: Boolean);
begin
  actIncluir.Enabled := not aEdicao;
  actCancelar.Enabled := aEdicao;
  actGravar.Enabled := aEdicao;
  actAtualizar.Enabled := not aEdicao;

  actPesquisar.Visible := not aEdicao;
  actCancelarPedido.Visible := not aEdicao;

  actIncluirProduto.Enabled := aEdicao;
end;

procedure TfrmPeido.qryItensBeforePost(DataSet: TDataSet);
begin
  qryItensDT_ATUALIZACAO.AsDateTime := now;
  qryItensID_PEDIDO.AsInteger := qryPedidoSEQ_PEDIDO.AsInteger;
end;

procedure TfrmPeido.qryPedidoBeforePost(DataSet: TDataSet);
begin
  qryPedidoDT_PEDIDO.AsDateTime := now;
end;

function TfrmPeido.SomenteNumerosKey(aKey: Char): Char;
begin
  if  not ( aKey in ['0'..'9', Chr(8), ','] ) then
    result := #0
  else
    result := aKey;
end;

procedure TfrmPeido.SpeedButton5Click(Sender: TObject);
begin
  qryItens.Cancel;
  qryPedido.Cancel;

  qryPedido.Connection.Transaction.Rollback;

  actAtualizarExecute(nil);
  HabilitaDesabilitaAciont(False { editando });
end;

end.
