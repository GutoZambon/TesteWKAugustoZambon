unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    Sobre1: TMenuItem;
    actSobre: TAction;
    pnlSobre: TPanel;
    btnFechar: TButton;
    mmSobre: TMemo;
    Vendas1: TMenuItem;
    actPedidos: TAction;
    Pedidos1: TMenuItem;
    procedure actSobreExecute(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure actPedidosExecute(Sender: TObject);
  private
    { Private declarations }

    /// <summary>
    ///   Fun??o que percorre todos os menus habilitando/desabilitando tudo
    /// </summary>
    procedure HabilitaDesabilitaMenu(aMenu: TMainMenu; aHabilita: Boolean);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uPedidos;

{$R *.dfm}

procedure TfrmPrincipal.actPedidosExecute(Sender: TObject);
begin
  frmPeido := TfrmPeido.Create(self);
  try
    frmPeido.ShowModal;
  finally
    FreeAndNil(frmPeido);
  end;
end;

procedure TfrmPrincipal.actSobreExecute(Sender: TObject);
begin
  mmSobre.Lines.Add('Desenvolvido por Augusto Aguiar Zambon');
  mmSobre.Lines.Add('mar?o/2021 Curitiba-PR');
  mmSobre.Lines.Add('Fone: 41 - 99845-7947');
  mmSobre.Lines.Add('e-mail: donzambon@gmail.com');

  pnlSobre.Visible := True;
  HabilitaDesabilitaMenu(MainMenu1, False { Habilita });
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  pnlSobre.Visible := False;
  HabilitaDesabilitaMenu(MainMenu1, True { Habilita });
end;

procedure TfrmPrincipal.HabilitaDesabilitaMenu(aMenu: TMainMenu;
  aHabilita: Boolean);
var
  I: Integer;
begin
  if not Assigned(aMenu) then
    Exit;

  for I := 0 to aMenu.Items.Count -1 do
    aMenu.Items[i].Enabled := aHabilita;
end;

end.
