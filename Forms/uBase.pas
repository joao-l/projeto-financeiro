unit uBase;

{Classe que sera um formul�rio 'Base' p/ outros formul�rios}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ActnList, StdCtrls, ComCtrls, Grids, DBGrids, DB,
  Buttons, DBClient, Validar, Mask;

type
  TFrmBase = class(TForm)
    Panel1: TPanel;
    BtnNovo: TButton;
    aclComandos: TActionList;
    ImgAcoes: TImageList;
    ACNovo: TAction;
    ACEditar: TAction;
    ACApagar: TAction;
    ACSair: TAction;
    BtnEditar: TButton;
    BtnApagar: TButton;
    BtnSair: TButton;
    StatusInfo: TStatusBar;
    DBGDados: TDBGrid;
    BtnSalvar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    PNDados: TPanel;
    DS: TDataSource;
    Validar: TValidar;
    GroupBox1: TGroupBox;
    cbBusca: TComboBox;
    edtValor: TEdit;
    procedure ACNovoExecute(Sender: TObject);
    procedure ACEditarExecute(Sender: TObject);
    procedure ACApagarExecute(Sender: TObject);
    procedure ACSairExecute(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetPesquisa;
    procedure edtValorChange(Sender: TObject);
    procedure cbBuscaChange(Sender: TObject);
    procedure DBGDadosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Acao(Tipo: String);
  public
    { Public declarations }
  end;

var
  FrmBase: TFrmBase;

implementation

uses uFuncoes;

{$R *.dfm}

{
  A��o padr�o p/ todos os formularios 'filhos'.
  Tipos de a��o: Salvar, Leitura, Alterar, Deletar e Cancelar
}
procedure TFrmBase.Acao(Tipo: String);
begin

  if Tipo = 'Read' then
  begin
    // Leitura

    // Controle de but�es necessarios p/ 'leitura'
    BtnNovo.Enabled := True;
    BtnEditar.Enabled := True;
    BtnApagar.Enabled := True;
    BtnSalvar.Enabled := False;
    BtnCancelar.Enabled := False;
    DBGDados.Enabled := True;
    PNDados.Enabled := False;

    // Fun��o que abre o DataSet, caso o mesmo n�o esteja ativo
    VerificaDataSet(DS);

    //Traz como um 'rodap�' o n�mero de registros encontrados no formulario
    StatusInfo.Panels[0].Text := ' ' + IntToStr(DS.DataSet.RecordCount) + ' Registros cadastrado';
  end;

  if Tipo = 'New' then
  begin
    // Novo

    // Controle de but�es necessarios p/ 'Novo'
    DS.DataSet.Insert;
    BtnNovo.Enabled := False;
    BtnEditar.Enabled := False;
    BtnApagar.Enabled := False;
    BtnSalvar.Enabled := True;
    BtnCancelar.Enabled := True;
    DBGDados.Enabled := False;
    PNDados.Enabled := True;
  end;

  if Tipo = 'Edit' then
  begin

    // Verificando se � algum registro no DataSet
    if not DS.DataSet.IsEmpty then
    begin
      DS.DataSet.Edit;

      // Controle de but�es necessarios p/ 'Edit'
      BtnNovo.Enabled := False;
      BtnEditar.Enabled := False;
      BtnApagar.Enabled := False;
      BtnSalvar.Enabled := True;
      BtnCancelar.Enabled := True;
      DBGDados.Enabled := False;
      PNDados.Enabled := True;
    end;
  end;

  if Tipo = 'Delete' then
  begin

    // Verificando se � algo a ser deletado
    if not DS.DataSet.IsEmpty then
    begin

      // Verifica��o de Exclus�o
      if Application.MessageBox('Deseja apagar este registro?', 'Exclus�o',MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = ID_YES then
      begin
        try
          DS.DataSet.Delete;
          // Cast do DataSet
          (DS.DataSet as TClientDataSet).ApplyUpdates(0);

          Application.MessageBox('Regsitro deletado com sucesso!', 'Exclus�o',MB_ICONINFORMATION + MB_OK);

          // Habilitando campos para modo leitura
          Acao('Read');
        Except
          // Caso erro:
          Application.MessageBox('Erro ao excluir!', 'Exclus�o',MB_ICONERROR + MB_OK);
        end;
      end;
    end;
  end;

  if Tipo = 'Save' then
  begin

    // Validar � um componente que verifica se todos os campos do formul�rio est�o preenchidos.
    // Ex.: Caso possua algum valor no formulario n�o preenchido o m�todo do componente irar
    // retornar false e n�o sera possivel realizar o 'Post'
    if Validar.Validar then
    begin

      // Controle de Campos
      BtnNovo.Enabled := True;
      BtnEditar.Enabled := True;
      BtnApagar.Enabled := True;
      BtnSalvar.Enabled := False;
      BtnCancelar.Enabled := False;
      DBGDados.Enabled := True;
      PNDados.Enabled := False;

      // Verifica se o status do DataSet se � para inser��o
      if DS.DataSet.State in [dsInsert] then
      begin
        try

          // V�lida tabela t�tulos p/ que sempre que crie um novo registro do mesmo
          // a data (DTCRIACAO) seja a de 'Hoje'
          if DS.DataSet.FindField('DTCRIACAO') <> nil then
          begin
            DS.DataSet.FieldByName('DTCRIACAO').Value := Now;
          end;

          // Realizando o Post:
          DS.DataSet.Post;
          (DS.DataSet as TClientDataSet).ApplyUpdates(0);

          // Mensagem ao Usuario:
          Application.MessageBox('Registro cadastrado com sucesso!','Cadastro', MB_ICONINFORMATION + MB_OK);
        except
          // Caso Erro:
          Application.MessageBox('Erro ao cadastrar!', 'Erro',MB_ICONERROR + MB_OK);
        end;
      end
      else
      // Caso o DataSet n�o esteja no status p/ inser��o(dsInsert)
      // o mesmo ent�o sera para edi��o.
        try
          DS.DataSet.Post;
          (DS.DataSet as TClientDataSet).ApplyUpdates(0);
          Application.MessageBox('Registro editado com sucesso!', 'Cadastro',MB_ICONINFORMATION + MB_OK);
        except
          Application.MessageBox('Erro ao editar!', 'Erro',MB_ICONERROR + MB_OK);
        end;
    end;
  end;

  if Tipo = 'Cancel' then
  begin
    // Caso o usuario cancele alguma opera��o.
    (DS.DataSet as TClientDataSet).CancelUpdates;
    Acao('Read');
  end;

end;

procedure TFrmBase.ACApagarExecute(Sender: TObject);
begin
  // A��o parao o bot�o 'Apagar'
  Acao('Delete');
end;

procedure TFrmBase.ACEditarExecute(Sender: TObject);
begin
  // A��o parao o bot�o 'Editar'
  Acao('Edit');
end;

procedure TFrmBase.ACNovoExecute(Sender: TObject);
begin
  // A��o parao o bot�o 'Novo'
  Acao('New');
end;

procedure TFrmBase.ACSairExecute(Sender: TObject);
begin
  // A��o parao o bot�o 'Sair'
  Close;
end;

procedure TFrmBase.BtnCancelarClick(Sender: TObject);
begin
  // A��o parao o bot�o 'Cancelar'
  Acao('Cancel');
end;

procedure TFrmBase.BtnSalvarClick(Sender: TObject);
begin
  // A��o parao o bot�o 'Salvar'
  Acao('Save');
end;

procedure TFrmBase.cbBuscaChange(Sender: TObject);
begin
  // Fun��o do campo de 'Busca', no qual a cada vez que o usu�rio selecionar
  // uma op��o p/ pesquisa (ex. de busca de nome p/ busca por cpf)
  // o campo 'edtValor' sera limpado, caso o mesmo j�
  // tenha pesquisado algo.
  edtValor.Text := '';
  edtValor.SetFocus;
end;

procedure TFrmBase.DBGDadosDblClick(Sender: TObject);
begin
   // A��o parao o bot�o 'Edit'
  Acao('Edit');
end;

procedure TFrmBase.edtValorChange(Sender: TObject);
var
  Position : Integer;
begin
  // Nesse passo pegamos o index de qual item o usuario esta pesquisando.
  Position := Integer(cbBusca.Items.Objects[cbBusca.ItemIndex]);

  // Aqui � feita a pesquisa, no qual passamos o DataSet como parametro
  // Informando qual campo do DataSet irar ser feito a pesquisa.
  // Em seguida passamos o valor a ser pesquisado.
  Pesquisa(DS, DS.DataSet.Fields[Position].FieldName, edtValor.Text);
end;

procedure TFrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Ao fechar o formulario o DataSet � encerrado.
  FechaDataSet(DS);
end;

procedure TFrmBase.FormShow(Sender: TObject);
begin
  // Liberando campos p/ leitura
  Acao('Read');

  // Carrega o ComboBox com os Itens de pesquisa
  GetPesquisa;
end;

procedure TFrmBase.GetPesquisa;
var
  I: Integer;
begin
  { Fun��o que preenche o ComboBox do campo de Busca }

  // Condi��o que passa por todos os campos do DataSet
  for I := 0 to DS.DataSet.Fields.Count - 1 do
  begin
    // Condi��o que irar filtrar os campos que ser�o adicionados no ComboBox p/ Pesquisa
    // Ex.: O campo CPF � do tipo string (ftString) ent�o o mesmo ser� adicionado ao ComboBox
    // p/ pesquisa
    if (DS.DataSet.Fields[I].DataType in [ftString]) or (DS.DataSet.Fields[I].DataType in [ftFMTBcd]) then
    begin

      // Condi��o p/ que n�o seja adicionado ao ComboBox a possibilidade de pesquisar por 'T�tular'
      if DS.DataSet.Fields[I].DisplayName <> 'T�tular' then
        cbBusca.Items.AddObject(DS.DataSet.Fields[I].DisplayName, TObject(I));
    end;
  end;
  // Setamos o ComboBox com o primeiro item, p/ que o mesmo n�o fique em Branco ao abrir o formul�rio
  cbBusca.ItemIndex := 0;

end;

end.
