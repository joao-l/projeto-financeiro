program SCF;

uses
  Forms,
  uPrincipal in 'Forms\uPrincipal.pas' {FrmPrincipal},
  uBase in 'Forms\uBase.pas' {FrmBase},
  uDM in 'Modules\uDM.pas' {DM: TDataModule},
  uFrmPessoas in 'Forms\uFrmPessoas.pas' {FrmPessoas},
  uFrmContasPagar in 'Forms\uFrmContasPagar.pas' {FrmContasPagar},
  uFuncoes in 'Unit\uFuncoes.pas',
  uFrmContasReceber in 'Forms\uFrmContasReceber.pas' {FrmContasReceber},
  uFrmPagamentoContas in 'Forms\uFrmPagamentoContas.pas' {FrmPagamentoContas},
  uDMRelatorios in 'Modules\uDMRelatorios.pas' {DMRelatorios: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SCF';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMRelatorios, DMRelatorios);
  Application.Run;
end.
