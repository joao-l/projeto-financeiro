object DMRelatorios: TDMRelatorios
  OldCreateOrder = False
  Height = 552
  Width = 794
  object sdsContasReceber: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'SELECT '#13#10'  p.NOME, '#13#10'  p.DTNASCIMENTO, '#13#10'  p.CIDADE, '#13#10'  p.ESTAD' +
      'O,'#13#10'  t.* '#13#10'FROM '#13#10' titulos t,'#13#10'  pessoas p '#13#10'WHERE t.TIPOTITULO' +
      ' = '#39'R'#39' AND t.CNPJCPF = p.CNPJCPF;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLCon
    Left = 712
    Top = 456
  end
  object dspContasReceber: TDataSetProvider
    DataSet = sdsContasReceber
    Left = 712
    Top = 392
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasReceber'
    Left = 712
    Top = 328
    object cdsContasReceberNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 125
    end
    object cdsContasReceberDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object cdsContasReceberCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
    object cdsContasReceberESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsContasReceberID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContasReceberDTCRIACAO: TDateField
      FieldName = 'DTCRIACAO'
    end
    object cdsContasReceberDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsContasReceberVALORTITULO: TFMTBCDField
      FieldName = 'VALORTITULO'
      Required = True
      Precision = 12
      Size = 2
    end
    object cdsContasReceberVALORJUROS: TFMTBCDField
      FieldName = 'VALORJUROS'
      Precision = 12
      Size = 2
    end
    object cdsContasReceberVLJUROSCALCULADO: TFMTBCDField
      FieldName = 'VLJUROSCALCULADO'
      Precision = 12
      Size = 2
    end
    object cdsContasReceberVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Precision = 12
      Size = 2
    end
    object cdsContasReceberDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
    end
    object cdsContasReceberVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Precision = 12
      Size = 2
    end
    object cdsContasReceberTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContasReceberCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Required = True
    end
    object cdsContasReceberNUMTITULO: TStringField
      FieldName = 'NUMTITULO'
      Size = 45
    end
  end
  object rvDSConnectionContasReceber: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsContasReceber
    Left = 712
    Top = 264
  end
  object RvRelatorios: TRvProject
    ProjectFile = 
      'C:\Users\User001\Downloads\Financeiro\App\bin\Relatorio\Projeto.' +
      'rav'
    Left = 112
    Top = 40
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 192
    Top = 40
  end
  object sdsContas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'SELECT p.NOME, t.* FROM titulos t, pessoas p WHERE t.CNPJCPF = p' +
      '.CNPJCPF;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLCon
    Left = 568
    Top = 456
  end
  object dspContas: TDataSetProvider
    DataSet = sdsContas
    Left = 568
    Top = 392
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas'
    Left = 568
    Top = 328
    object cdsContasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 125
    end
    object cdsContasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContasDTCRIACAO: TDateField
      FieldName = 'DTCRIACAO'
    end
    object cdsContasDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsContasVALORTITULO: TFMTBCDField
      FieldName = 'VALORTITULO'
      Required = True
      Precision = 12
      Size = 2
    end
    object cdsContasVALORJUROS: TFMTBCDField
      FieldName = 'VALORJUROS'
      Precision = 12
      Size = 2
    end
    object cdsContasVLJUROSCALCULADO: TFMTBCDField
      FieldName = 'VLJUROSCALCULADO'
      Precision = 12
      Size = 2
    end
    object cdsContasVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Precision = 12
      Size = 2
    end
    object cdsContasDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
    end
    object cdsContasVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Precision = 12
      Size = 2
    end
    object cdsContasTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContasCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Required = True
    end
    object cdsContasNUMTITULO: TStringField
      FieldName = 'NUMTITULO'
      Size = 45
    end
  end
  object rvDSConnectionContas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsContas
    Left = 568
    Top = 264
  end
  object sdsContasPagar: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'SELECT '#13#10'  p.NOME, '#13#10'  p.DTNASCIMENTO, '#13#10'  p.CIDADE, '#13#10'  p.ESTAD' +
      'O,'#13#10'  t.* '#13#10'FROM '#13#10' titulos t,'#13#10'  pessoas p '#13#10'WHERE t.TIPOTITULO' +
      ' = '#39'P'#39' AND t.CNPJCPF = p.CNPJCPF;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLCon
    Left = 428
    Top = 456
  end
  object dspContasPagar: TDataSetProvider
    DataSet = sdsContasPagar
    Left = 428
    Top = 392
  end
  object cdsContasPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagar'
    Left = 428
    Top = 328
    object cdsContasPagarNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 125
    end
    object cdsContasPagarDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object cdsContasPagarCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
    object cdsContasPagarESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsContasPagarID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContasPagarDTCRIACAO: TDateField
      FieldName = 'DTCRIACAO'
    end
    object cdsContasPagarDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsContasPagarVALORTITULO: TFMTBCDField
      FieldName = 'VALORTITULO'
      Required = True
      Precision = 12
      Size = 2
    end
    object cdsContasPagarVALORJUROS: TFMTBCDField
      FieldName = 'VALORJUROS'
      Precision = 12
      Size = 2
    end
    object cdsContasPagarVLJUROSCALCULADO: TFMTBCDField
      FieldName = 'VLJUROSCALCULADO'
      Precision = 12
      Size = 2
    end
    object cdsContasPagarVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Precision = 12
      Size = 2
    end
    object cdsContasPagarDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
    end
    object cdsContasPagarVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Precision = 12
      Size = 2
    end
    object cdsContasPagarTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContasPagarCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Required = True
    end
    object cdsContasPagarNUMTITULO: TStringField
      FieldName = 'NUMTITULO'
      Size = 45
    end
  end
  object rvDSConnectionContasPagar: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsContasPagar
    Left = 428
    Top = 264
  end
  object sdsPessoas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'SELECT * FROM pessoas;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLCon
    Left = 269
    Top = 456
  end
  object dspPessoas: TDataSetProvider
    DataSet = sdsPessoas
    Left = 269
    Top = 392
  end
  object cdsPessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoas'
    Left = 269
    Top = 328
    object cdsPessoasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPessoasCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPessoasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 125
    end
    object cdsPessoasDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object cdsPessoasCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsPessoasLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 45
    end
    object cdsPessoasNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsPessoasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 45
    end
    object cdsPessoasCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
    object cdsPessoasESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
  end
  object rvDSConnectionPessoas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsPessoas
    Left = 269
    Top = 264
  end
  object sdsContasPagasRecebidas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'SELECT p.NOME, t.* FROM titulos t, pessoas p WHERE t.CNPJCPF = p' +
      '.CNPJCPF AND t.DTPAGAMENTO is NOT NULL;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLCon
    Left = 83
    Top = 456
  end
  object dspContasPagasRecebidas: TDataSetProvider
    DataSet = sdsContasPagasRecebidas
    Left = 83
    Top = 392
  end
  object cdsContasPagasRecebidas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagasRecebidas'
    Left = 83
    Top = 328
    object cdsContasPagasRecebidasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 125
    end
    object cdsContasPagasRecebidasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContasPagasRecebidasDTCRIACAO: TDateField
      FieldName = 'DTCRIACAO'
    end
    object cdsContasPagasRecebidasDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsContasPagasRecebidasVALORTITULO: TFMTBCDField
      FieldName = 'VALORTITULO'
      Required = True
      Precision = 12
      Size = 2
    end
    object cdsContasPagasRecebidasVALORJUROS: TFMTBCDField
      FieldName = 'VALORJUROS'
      Precision = 12
      Size = 2
    end
    object cdsContasPagasRecebidasVLJUROSCALCULADO: TFMTBCDField
      FieldName = 'VLJUROSCALCULADO'
      Precision = 12
      Size = 2
    end
    object cdsContasPagasRecebidasVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Precision = 12
      Size = 2
    end
    object cdsContasPagasRecebidasDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
    end
    object cdsContasPagasRecebidasVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Precision = 12
      Size = 2
    end
    object cdsContasPagasRecebidasTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContasPagasRecebidasCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Required = True
    end
    object cdsContasPagasRecebidasNUMTITULO: TStringField
      FieldName = 'NUMTITULO'
      Size = 45
    end
  end
  object rvDSConContasPagasRecebidas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsContasPagasRecebidas
    Left = 83
    Top = 264
  end
end
