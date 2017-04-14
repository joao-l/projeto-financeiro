unit uPrincipal;
{ TELA PRINCIPAL }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, jpeg, Buttons, ActnList, ImgList;

type
  TFrmPrincipal = class(TForm)
    MMenu: TMainMenu;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    Contasapagar1: TMenuItem;
    Contasareceber1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    STBar: TStatusBar;
    Image1: TImage;
    ACL: TActionList;
    IMGL: TImageList;
    ACCliente: TAction;
    SpeedButton1: TSpeedButton;
    ACPagar: TAction;
    ACReceber: TAction;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ACRelatorios: TAction;
    ACSair: TAction;
    SpeedButton5: TSpeedButton;
    ACPagamentoContas: TAction;
    SpeedButton8: TSpeedButton;
    Timer: TTimer;
    Pagamento1: TMenuItem;
    PagdeContas1: TMenuItem;
    Relatorios1: TMenuItem;
    ContasaReceber2: TMenuItem;
    ContasaPagar2: TMenuItem;
    odasasContas1: TMenuItem;
    Clientes2: TMenuItem;
    ContasPagaseRecebidas1: TMenuItem;
    procedure ACClienteExecute(Sender: TObject);
    procedure ACPagamentoContasExecute(Sender: TObject);
    procedure ACPagarExecute(Sender: TObject);
    procedure ACReceberExecute(Sender: TObject);
    procedure ACSairExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure odasasContas1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure ContasPagaseRecebidas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses uFrmPessoas, uFrmContasPagar, uFrmContasReceber, uFrmPagamentoContas,
  uDMRelatorios;

{$R *.dfm}

procedure TFrmPrincipal.ACClienteExecute(Sender: TObject);
begin
  { FORMULARIO DE CLIENTES }
  try
    FrmPessoas := TFrmPessoas.Create(Self);
    FrmPessoas.ShowModal;
  finally
    FreeAndNil(FrmPessoas);
  end;
end;

procedure TFrmPrincipal.ACPagarExecute(Sender: TObject);
begin
  { FORMULARIO DE CONTAS A PAGAR }
  try
    FrmContasPagar := TFrmContasPagar.Create(Self);
    FrmContasPagar.ShowModal;
  finally
    FreeAndNil(FrmContasPagar);
  end;
end;

procedure TFrmPrincipal.ACReceberExecute(Sender: TObject);
begin
  { FORMULARIO DE CONTAS A RECEBER }
  try
    FrmContasReceber := TFrmContasReceber.Create(Self);
    FrmContasReceber.ShowModal;
  finally
    FreeAndNil(FrmContasReceber);
  end;
end;

procedure TFrmPrincipal.ACSairExecute(Sender: TObject);
begin
  { FIM DA APLICA��O }
  Application.Terminate;
end;


procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
begin
  { RELATORIO DE PESSOAS }
  DMRelatorios.RvRelatorios.ExecuteReport('RelatorioPessoas');
end;

procedure TFrmPrincipal.ContasaPagar2Click(Sender: TObject);
begin
  { RELATORIO DE CONTAS A PAGAR }
  DMRelatorios.RvRelatorios.ExecuteReport('RelatorioContasPagar');
end;

procedure TFrmPrincipal.ContasaReceber2Click(Sender: TObject);
begin
  { RELATORIO DE CONTAS A RECEBER }
  DMRelatorios.RvRelatorios.ExecuteReport('RelatorioContasReceber');
end;

procedure TFrmPrincipal.ContasPagaseRecebidas1Click(Sender: TObject);
begin
  { RELATORIO DE PAGAMENTOS E RECEBIMENTOS DE CONTAS }
  DMRelatorios.RvRelatorios.ExecuteReport('RelatorioContasPagasERecebidas');
end;

procedure TFrmPrincipal.odasasContas1Click(Sender: TObject);
begin
  { RELATORIO DE TODAS OS T�TULOS }
  DMRelatorios.RvRelatorios.ExecuteReport('RelatorioContas');
end;

procedure TFrmPrincipal.ACPagamentoContasExecute(Sender: TObject);
begin
  { FORMULARIO DE PAGAMENTO E RECEBIMENTO DE CONTAS }
  try
    FrmPagamentoContas := TFrmPagamentoContas.Create(Self);
    FrmPagamentoContas.ShowModal;
  finally
    FreeAndNil(FrmContasReceber);
  end;
end;

procedure TFrmPrincipal.TimerTimer(Sender: TObject);
begin
  // Colocado como um 'rodape' a Data/Hora p/ ser apresentado ao usuario
  STBar.Panels[0].Text := 'Data: ' + DateToStr(date) + ' - Hora: ' + TimeToStr(time);
end;

end.
