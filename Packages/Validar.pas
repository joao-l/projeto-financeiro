unit Validar;

interface

uses
  SysUtils, Classes, DB, Dialogs;

type
  TValidar = class(TComponent)
  private
    FActive: Boolean;
    FDataSet: TDataSource;
    FMensagem: string;
    procedure SetActive(const Value: Boolean);
    procedure SetDataSet(const Value: TDataSource);
    procedure SetMensagem(const Value: string);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    function Validar(): Boolean;
  published
    { Published declarations }
    property Active: Boolean read FActive write SetActive;
    property DataSet: TDataSource read FDataSet write SetDataSet;
    property Mensagem: string read FMensagem write SetMensagem;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TestComponents', [TValidar]);
end;

{ TValidator }

procedure TValidar.SetActive(const Value: Boolean);
begin
  FActive := Value;
end;

procedure TValidar.SetDataSet(const Value: TDataSource);
begin
  FDataSet := Value;
end;

procedure TValidar.SetMensagem(const Value: string);
begin
  FMensagem := Value;
end;

function TValidar.Validar: Boolean;
var
  i: integer;
begin

  Result := True;

  if Active then
  begin
    for i := 0 to DataSet.DataSet.FieldCount - 1 do
      if DataSet.DataSet.Fields[i].Required then
      // Verifica se o campo � requirido
        if (DataSet.DataSet.Fields[i].IsNull) or
          (DataSet.DataSet.Fields[i].AsString = '') then
        // Verifica se o campo � nulo
        begin
          ShowMessage(Mensagem + ' ' + QuotedStr(DataSet.DataSet.Fields[i].DisplayLabel)); // Mensagem definida pelo usuario, nas propriedades do componente
          Result := False; // Sera validado na hora do post
          DataSet.DataSet.Fields[i].FocusControl;
          Break
        end;

  end;

end;

end.
