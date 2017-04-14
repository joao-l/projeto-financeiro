unit uFrmContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, Validar, DB, ImgList, ActnList, Buttons, Grids, DBGrids,
  ComCtrls, StdCtrls, ExtCtrls, Mask, DBCtrls;

type
  TFrmContasPagar = class(TFrmBase)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    gpPeriodo: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edtPeriodoFinal: TMaskEdit;
    edtPeriodoInicial: TMaskEdit;
    Pesquisar: TButton;
    btnLimparFiltros: TButton;
    Label7: TLabel;
    cbPessoas: TDBLookupComboBox;
    Label2: TLabel;
    cbTipo: TComboBox;
    procedure PesquisarClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure ACApagarExecute(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContasPagar: TFrmContasPagar;

implementation

uses uDM, uFuncoes;

{$R *.dfm}

procedure TFrmContasPagar.ACApagarExecute(Sender: TObject);
begin

  if DS.DataSet.FieldByName('VALORPAGO').IsNull then
    inherited
  else
    ShowMessage('N�o � poss�vel apagar um t�tulo j� pago!');

end;

procedure TFrmContasPagar.btnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  // Caso o usu�rio deseje apagar os campos de pesquisa:
  LimparPesquisas(DS);
  LimparCamposPeriodo(edtPeriodoInicial, edtPeriodoFinal, edtValor);
end;

procedure TFrmContasPagar.BtnSalvarClick(Sender: TObject);
begin
  // Atualizando o campo 'TIPOTITULO' p/ 'P'
  // p = Contas a Pagar
  DS.DataSet.FieldByName('TIPOTITULO').Value := String(cbTipo.Items.GetText);
  inherited;
end;

procedure TFrmContasPagar.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Bloqueio p/ que o usuario digite apenas n�meros no campo de 'N�mero do T�tulo'
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmContasPagar.PesquisarClick(Sender: TObject);
begin
  inherited;
  // A��o p/ pesquisa por per�odo
  PesquisaPorDataCriacao(DS, 'DTCRIACAO', edtPeriodoInicial.Text, edtPeriodoFinal.Text);
end;

end.
