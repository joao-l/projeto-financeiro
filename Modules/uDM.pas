unit uDM;

interface

uses
  SysUtils, Classes, WideStrings, DBXMySql, FMTBcd, DBClient, Provider, DB,
  SqlExpr;

type
  TDM = class(TDataModule)
    SQLCon: TSQLConnection;
    sdsPessoas: TSQLDataSet;
    dspPessoas: TDataSetProvider;
    cdsPessoas: TClientDataSet;
    sdsPessoasID: TIntegerField;
    sdsPessoasCNPJCPF: TStringField;
    sdsPessoasNOME: TStringField;
    sdsPessoasDTNASCIMENTO: TDateField;
    sdsPessoasCEP: TStringField;
    sdsPessoasLOGRADOURO: TStringField;
    sdsPessoasNUMERO: TStringField;
    sdsPessoasBAIRRO: TStringField;
    sdsPessoasCIDADE: TStringField;
    sdsPessoasESTADO: TStringField;
    cdsPessoasID: TIntegerField;
    cdsPessoasCNPJCPF: TStringField;
    cdsPessoasNOME: TStringField;
    cdsPessoasDTNASCIMENTO: TDateField;
    cdsPessoasCEP: TStringField;
    cdsPessoasLOGRADOURO: TStringField;
    cdsPessoasNUMERO: TStringField;
    cdsPessoasBAIRRO: TStringField;
    cdsPessoasCIDADE: TStringField;
    cdsPessoasESTADO: TStringField;
    cdsContasPagar: TClientDataSet;
    dspContasPagar: TDataSetProvider;
    sdsContasPagar: TSQLDataSet;
    sdsContasReceber: TSQLDataSet;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    sdsPagamentoContas: TSQLDataSet;
    dspPagamentoContas: TDataSetProvider;
    cdsPagamentoContas: TClientDataSet;
    cdsContasPagarID: TIntegerField;
    cdsContasPagarDTCRIACAO: TDateField;
    cdsContasPagarDTVENCIMENTO: TDateField;
    cdsContasPagarVALORTITULO: TFMTBCDField;
    cdsContasPagarVALORJUROS: TFMTBCDField;
    cdsContasPagarVLJUROSCALCULADO: TFMTBCDField;
    cdsContasPagarVALORDESCONTO: TFMTBCDField;
    cdsContasPagarDTPAGAMENTO: TDateField;
    cdsContasPagarVALORPAGO: TFMTBCDField;
    cdsContasPagarTIPOTITULO: TStringField;
    cdsContasPagarCNPJCPF: TStringField;
    cdsContasPagarNUMTITULO: TStringField;
    cdsContasPagarListPessoas: TStringField;
    cdsContasReceberID: TIntegerField;
    cdsContasReceberDTCRIACAO: TDateField;
    cdsContasReceberDTVENCIMENTO: TDateField;
    cdsContasReceberVALORTITULO: TFMTBCDField;
    cdsContasReceberVALORJUROS: TFMTBCDField;
    cdsContasReceberVLJUROSCALCULADO: TFMTBCDField;
    cdsContasReceberVALORDESCONTO: TFMTBCDField;
    cdsContasReceberDTPAGAMENTO: TDateField;
    cdsContasReceberVALORPAGO: TFMTBCDField;
    cdsContasReceberTIPOTITULO: TStringField;
    cdsContasReceberCNPJCPF: TStringField;
    cdsContasReceberNUMTITULO: TStringField;
    cdsContasReceberListPessoas: TStringField;
    cdsPagamentoContasID: TIntegerField;
    cdsPagamentoContasDTCRIACAO: TDateField;
    cdsPagamentoContasDTVENCIMENTO: TDateField;
    cdsPagamentoContasVALORTITULO: TFMTBCDField;
    cdsPagamentoContasVALORJUROS: TFMTBCDField;
    cdsPagamentoContasVLJUROSCALCULADO: TFMTBCDField;
    cdsPagamentoContasVALORDESCONTO: TFMTBCDField;
    cdsPagamentoContasDTPAGAMENTO: TDateField;
    cdsPagamentoContasVALORPAGO: TFMTBCDField;
    cdsPagamentoContasTIPOTITULO: TStringField;
    cdsPagamentoContasCNPJCPF: TStringField;
    cdsPagamentoContasNUMTITULO: TStringField;
    cdsPagamentoContasListPessoas: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetID(DataSet: TDataSet);
    function GetID(Table: string): Integer;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  Dialogs;
{$R *.dfm}
{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TClientDataSet then
    begin
      // Antes de realizar qualquer Post, o ID é setado (isso p/ qualquer tabela)
      TClientDataSet(Components[I]).BeforePost := SetID;
    end;

end;

function TDM.GetID(Table: String): Integer;
var
  SqlQuery: TSQLQuery;
begin
  // Função que retorna do bancos de dado a informação de quem sera o próximo ID de qualquer tabela
  // Tornando assim possivel saber quem será o proximo ID na inserção de um novo registro
  SqlQuery := TSQLQuery.Create(Self);
  SqlQuery.SQLConnection := SQLCon;
  SqlQuery.SQL.Add('SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = ' + QuotedStr(Table));

  SqlQuery.Open;

  Result := SqlQuery.Fields[0].Value;
end;

procedure TDM.SetID(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert] then
    if cdsPessoas.State in [dsInsert] then
      // Retorna o proximo ID da tabela Pessoas
      DataSet.Fields[0].Value := GetID('PESSOAS')
    else
      // Retorna o proximo ID da tabela Titulos
      DataSet.Fields[0].Value := GetID('TITULOS');
end;

end.
