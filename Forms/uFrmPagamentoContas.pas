unit uFrmPagamentoContas;

interface

uses
  Windows, Messages, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, Validar, DB, ImgList, ActnList, Buttons, Grids, DBGrids,
  ComCtrls, StdCtrls, ExtCtrls, Mask, DBCtrls;

type
  TFrmPagamentoContas = class(TFrmBase)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    edtVencimento: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    edtPagamento: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure ACEditarExecute(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPagamentoContas: TFrmPagamentoContas;

implementation

uses uDM, SysUtils, uFuncoes;
{$R *.dfm}

procedure TFrmPagamentoContas.ACEditarExecute(Sender: TObject);
begin

  // Valida��o p/ que o usuario n�o consiga dar baixar em um t�tulo
  // j� pago
  if DS.DataSet.FieldByName('VALORPAGO').IsNull then
    inherited
  else
    ShowMessage('T�tulo j� possui baixa!');
end;

procedure TFrmPagamentoContas.BtnSalvarClick(Sender: TObject);
var
  DiasEmAtraso: Integer;
  JurosCalculado: Double;
begin
  // Antes de Realizar o Post � feito o calculo de Juros:

  if Validar.Validar then
  begin
    // DiasEmAtraso recebe a quantidad de dias em atraso (DataVencimento - DataPagamento)
    DiasEmAtraso := retornaDiasEmAtraso(DS.DataSet.FieldByName('DTPAGAMENTO').AsDateTime, DS.DataSet.FieldByName('DTVENCIMENTO').AsDateTime);

    // Caso ele possua dias em atraso:
    if DiasEmAtraso > 0 then
    begin
      // Calculo do Juros � feito, e o DataSet recebe o valor do Juros atualizado
      JurosCalculado := calcularJuros(DS.DataSet.FieldByName('VALORJUROS').Value, DS.DataSet.FieldByName('VALORTITULO').Value, DiasEmAtraso);
      DS.DataSet.FieldByName('VALORJUROS').Value := JurosCalculado;
    end;
  end;
  inherited;

end;

procedure TFrmPagamentoContas.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  // Atualizando o T�tulo do bot�o, p/ que o usuario saiba
  // a que t�tulo ele se refere (Pagamento Ou Recebimento)
  if DS.DataSet.FieldByName('TIPOTITULO').Value = 'R' then
    BtnEditar.Caption := 'Recebimento'
  else
    BtnEditar.Caption := 'Pagamento'
end;

end.
