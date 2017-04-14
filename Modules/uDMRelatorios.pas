unit uDMRelatorios;

interface

uses
  SysUtils, Classes, FMTBcd, RpBase, RpSystem, RpRave, RpDefine, RpCon, RpConDS,
  DBClient, Provider, DB, SqlExpr, uDM;

type
  TDMRelatorios = class(TDataModule)
    sdsContasReceber: TSQLDataSet;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    rvDSConnectionContasReceber: TRvDataSetConnection;
    RvRelatorios: TRvProject;
    RvSystem1: TRvSystem;
    cdsContasReceberNOME: TStringField;
    cdsContasReceberDTNASCIMENTO: TDateField;
    cdsContasReceberCIDADE: TStringField;
    cdsContasReceberESTADO: TStringField;
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
    sdsContas: TSQLDataSet;
    dspContas: TDataSetProvider;
    cdsContas: TClientDataSet;
    cdsContasNOME: TStringField;
    cdsContasID: TIntegerField;
    cdsContasDTCRIACAO: TDateField;
    cdsContasDTVENCIMENTO: TDateField;
    cdsContasVALORTITULO: TFMTBCDField;
    cdsContasVALORJUROS: TFMTBCDField;
    cdsContasVLJUROSCALCULADO: TFMTBCDField;
    cdsContasVALORDESCONTO: TFMTBCDField;
    cdsContasDTPAGAMENTO: TDateField;
    cdsContasVALORPAGO: TFMTBCDField;
    cdsContasTIPOTITULO: TStringField;
    cdsContasCNPJCPF: TStringField;
    cdsContasNUMTITULO: TStringField;
    rvDSConnectionContas: TRvDataSetConnection;
    sdsContasPagar: TSQLDataSet;
    dspContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    rvDSConnectionContasPagar: TRvDataSetConnection;
    sdsPessoas: TSQLDataSet;
    dspPessoas: TDataSetProvider;
    cdsPessoas: TClientDataSet;
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
    rvDSConnectionPessoas: TRvDataSetConnection;
    cdsContasPagarNOME: TStringField;
    cdsContasPagarDTNASCIMENTO: TDateField;
    cdsContasPagarCIDADE: TStringField;
    cdsContasPagarESTADO: TStringField;
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
    sdsContasPagasRecebidas: TSQLDataSet;
    dspContasPagasRecebidas: TDataSetProvider;
    cdsContasPagasRecebidas: TClientDataSet;
    cdsContasPagasRecebidasNOME: TStringField;
    cdsContasPagasRecebidasID: TIntegerField;
    cdsContasPagasRecebidasDTCRIACAO: TDateField;
    cdsContasPagasRecebidasDTVENCIMENTO: TDateField;
    cdsContasPagasRecebidasVALORTITULO: TFMTBCDField;
    cdsContasPagasRecebidasVALORJUROS: TFMTBCDField;
    cdsContasPagasRecebidasVLJUROSCALCULADO: TFMTBCDField;
    cdsContasPagasRecebidasVALORDESCONTO: TFMTBCDField;
    cdsContasPagasRecebidasDTPAGAMENTO: TDateField;
    cdsContasPagasRecebidasVALORPAGO: TFMTBCDField;
    cdsContasPagasRecebidasTIPOTITULO: TStringField;
    cdsContasPagasRecebidasCNPJCPF: TStringField;
    cdsContasPagasRecebidasNUMTITULO: TStringField;
    rvDSConContasPagasRecebidas: TRvDataSetConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorios: TDMRelatorios;

implementation


{$R *.dfm}

end.
