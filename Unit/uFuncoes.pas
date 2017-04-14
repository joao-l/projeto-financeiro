unit uFuncoes;

interface

uses
  DB, StdCtrls, Classes, Mask;

procedure VerificaDataSet(DataSet: TDataSource);
procedure FechaDataSet(DataSet: TDataSource);
procedure Pesquisa(DS: TDataSource; Field: string; Value: string);
procedure PesquisaPorDataCriacao(DS: TDataSource; Field: string; DTInicial, DTFinal: string);
procedure LoadListPessoas(ComboBox: TComboBox);
procedure LimparPesquisas(DS: TDataSource);
procedure LimparCamposPeriodo(dtInicial, dtFinal: TMaskEdit; Value: TEdit);
function calcularJuros(JurosSugerido, ValorTitulo, qtdDiasEmAtraso : Double): Double;
function retornaDiasEmAtraso(DtPagamento, DtVencimento: TDate): Integer;

implementation

uses
  SysUtils, DBXCommon, Forms, Windows, DateUtils;

procedure VerificaDataSet(DataSet: TDataSource);
begin

  // Caso o DataSet esteja 'fechado', o mesmo sera aberto:
  if not DataSet.DataSet.Active then
  begin
    DataSet.DataSet.Open;
  end;

end;

procedure FechaDataSet(DataSet: TDataSource);
begin
  // Fecha o DataSet:
  DataSet.DataSet.Close;
end;

procedure Pesquisa(DS: TDataSource; Field: string; Value: string);
begin

  // Se o tipo do DataSet for numérico:
  if DS.DataSet.FieldByName(Field).DataType in [ftFMTBcd] then
  begin
    if String(Value) <> '' then
    begin
      // Filtrando o DataSet com o valor(Value) passado pelo usuario

      // Caso o Valor do DataSet.Field seja igual ao valor (Value)
      // o mesmo sera filtrado e mostrado na Grid que fica no formulario
      DS.DataSet.Filter := Field + ' = ' + Value;
      DS.DataSet.Filtered := True;
    end;
  end
  // Se o tipo do DataSet for string:
  else if DS.DataSet.FieldByName(Field).DataType in [ftString] then
  begin
    // Mesma ação dito acima, caso o DataSet possua o valor igual ao que o
    // usuario informou, o mesmo sera filtrado e mostrado na tela:
    DS.DataSet.Filter := '' + Field + ' like ' + QuotedStr('%' + Value + '%');
    DS.DataSet.Filtered := True;
  end;

end;

procedure PesquisaPorDataCriacao(DS: TDataSource; Field: string; DTInicial, DTFinal: string);
var
  Inicio, Fim: TStrings;
begin

  // Valida caso a Data Preenchida esteja vazia
  if (DTInicial = '  /  /    ') or (DTFinal = '  /  /    ') then
    Application.MessageBox('Data inválida !', 'Erro',MB_ICONERROR + MB_OK)
  else

    // Se a data de emissão for maior ou igual a data inicial e menor ou igual a data inicial
    // Então o DataSet irar filtrar na Grid as datas que estão nesse periodo (data inicial e data final)
    DS.DataSet.Filter := '(DTCRIACAO >= (''' + DTInicial + ''')) AND (DTCRIACAO <= (''' + DTFinal + '''))';
    DS.DataSet.Filtered := True;

end;

procedure LoadListPessoas(ComboBox: TComboBox);
var
  Con : TDBXConnection;
  Cmd : TDBXCommand;
  Reader : TDBXReader;
begin

  { RETORNA TODOS OS REGISTROS DA TABELA 'PESSOAS' }

  Con := TDBXConnectionFactory.GetConnectionFactory.GetConnection('APPFINAN', 'root', 'root');
  Cmd := Con.CreateCommand;
  Cmd.Text := 'SELECT * FROM PESSOAS';

  Reader := Cmd.ExecuteQuery;
  while Reader.Next do
    ComboBox.Items.Add(Reader.Value[1].GetAnsiString);

end;

procedure LimparPesquisas(DS: TDataSource);
begin
  // Caso possua algum registro filtrado na Grid,
  // o mesmo irar desabilitar esse filtro ao ser chamado.
  DS.DataSet.Filtered := False;
end;

procedure LimparCamposPeriodo(dtInicial, dtFinal: TMaskEdit; Value: TEdit);
begin
  { LIMPA OS CAMPOS DE BUSCA }
  dtInicial.Text := '';
  dtFinal.Text := '';
  Value.Text := '';
end;

function calcularJuros(JurosSugerido, ValorTitulo, qtdDiasEmAtraso : Double): Double;
begin
  // Calculo de Juros:
  Result := (((JurosSugerido/100) * ValorTitulo) / 30 ) * qtdDiasEmAtraso;
end;

function retornaDiasEmAtraso(DtPagamento, DtVencimento: TDate): Integer;
begin
  // Retorna a quantidade de Dias em atraso:
  Result := DaysBetween(DtVencimento, DtPagamento);
end;

end.
