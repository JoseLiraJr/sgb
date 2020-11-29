unit uBombaController;

interface

uses
  System.SysUtils, Data.DB, Bomba;

type
  TBombaController = class
  private
    fBomba : TBomba;
  public
    function Save(dtSource : TDataSource) : Integer;
    procedure Open(dtSource : TDataSource);
    procedure Insert(dtSource : TDataSource);
    procedure Edit(dtSource : TDataSource);
    function Delete(dtSource : TDataSource) : Boolean;
    procedure Filter(dtSource : TDataSource; tpPesquisa : Integer; valor : string); overload;
    procedure Cancel(dtSource : TDataSource);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TBombaController }

procedure TBombaController.Cancel(dtSource: TDataSource);
begin
  if not(fBomba.Cancel(dtSource)) then
    raise Exception.Create('Erro ao tentar cancelar a opera��o!');
end;

constructor TBombaController.Create;
begin
  fBomba := TBomba.Create;
  inherited Create;
end;

function TBombaController.Delete(dtSource: TDataSource): Boolean;
begin
  if (dtSource.DataSet.RecordCount <= 0) then
    raise Exception.Create('A tabela est� vazia!');

  Result:= fBomba.Delete(dtSource);
  if not(Result) then
   raise Exception.Create('Erro ao tentar excluir o resgistro');
end;

destructor TBombaController.Destroy;
begin
  fBomba.Free;
  inherited Destroy;
end;

procedure TBombaController.Edit(dtSource: TDataSource);
begin
   if not(fBomba.Edit(dtSource)) then
   raise Exception.Create('Erro ao tentar colocar a tabela de cadastro de Bombas em modo de edi��o!');
end;

procedure TBombaController.Insert(dtSource: TDataSource);
begin
  if not(fBomba.Insert(dtSource)) then
   raise Exception.Create('Erro ao tentar colocar a tabela de cadastro de Bombas em modo de inser��o!');
end;

procedure TBombaController.Filter(dtSource: TDataSource; tpPesquisa: Integer; valor : string);
var
  vlrInt : Integer;
begin
  if (valor = '') then
   raise Exception.Create('Valor da pesquisa est� vazio!');

  if (tpPesquisa = 0) then
    begin
      if (valor.ToUpper = 'GASOLINA') then
       vlrInt := 0
      else
      if (valor.ToUpper = 'DIESEL') then
       vlrInt := 1
      else
      if (valor.ToUpper = 'ALCOOL') then
       vlrInt := 2
      else
       begin
         try
           vlrInt := StrToInt(valor);
         except
           vlrInt := -1;
         end;
       end;

      if not(fBomba.Filter(dtSource, vlrInt)) then
       raise Exception.Create('Erro ao ralizar a pesquisa');
    end
  else
  if not(fBomba.Filter(dtSource, valor)) then
    raise Exception.Create('Erro ao ralizar a pesquisa');
end;

procedure TBombaController.Open(dtSource: TDataSource);
begin
  if not(fBomba.Open(dtSource)) then
   raise Exception.Create('Erro ao abrir a tabela de cadastro de bombas!');
end;

function TBombaController.Save(dtSource: TDataSource): Integer;
begin
  if not(Assigned(dtSource)) then
    raise Exception.Create('A tabela n�o est� criada em mem�ria!');

  if (dtSource.DataSet.FieldByName('DESCRICAO').AsString = '') then
    raise Exception.Create('Informe uma descri��o para a Bomba, antes de continuar!');

  if (dtSource.DataSet.FieldByName('TP_COMBUSTIVEL').AsInteger < 0) then
    raise Exception.Create('Informe o tipo de combust�vel, antes de continuar!');

  Result := fBomba.Salvar(dtSource);
  if (Result <= 0) then
   raise Exception.Create('Erro ao tentar salvar um resgistro na tabela de cadastro de bombas');
end;

end.
