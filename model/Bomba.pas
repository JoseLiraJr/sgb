unit Bomba;

interface

uses
  Data.DB, System.SysUtils;

type
  TBomba = class

  public
    function Salvar(dtSource : TDataSource) : Integer;
    function Open(dtSource : TDataSource) : Boolean;
    function Insert(dtSource : TDataSource) : Boolean;
    function Edit(dtSource : TDataSource) : Boolean;
    function Delete(dtSource : TDataSource) : Boolean;
    function Filter(dtSource: TDataSource; vlrPesquisa: Integer) : Boolean; overload;
    function Filter(dtSource: TDataSource; vlrPesquisa: string) : Boolean; overload;
    function Cancel(dtSource: TDataSource) : Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TBomba }

function TBomba.Cancel(dtSource: TDataSource): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Cancel;
  except
    Result := False;
  end;
end;

constructor TBomba.Create;
begin
  inherited Create;
end;

function TBomba.Delete(dtSource: TDataSource): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Delete;
  except
    Result := False;
  end;
end;

destructor TBomba.Destroy;
begin
  inherited Destroy;
end;

function TBomba.Edit(dtSource: TDataSource): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Edit;
  except
    Result := False;
  end;
end;

function TBomba.Insert(dtSource: TDataSource): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Insert;
  except
    Result := False;
  end;
end;

function TBomba.Filter(dtSource: TDataSource; vlrPesquisa: string): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Filtered := False;
    dtSource.DataSet.Filter := 'DESCRICAO LIKE ' + QuotedStr('%' + vlrPesquisa + '%');
    dtSource.DataSet.Filtered := True;
  except
    Result := False;
  end;
end;

function TBomba.Filter(dtSource: TDataSource; vlrPesquisa: Integer): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Filtered := False;
    dtSource.DataSet.Filter := 'TP_COMBUSTIVEL = ' + IntToStr(vlrPesquisa);
    dtSource.DataSet.Filtered := True;
  except
    Result := False;
  end;
end;

function TBomba.Open(dtSource: TDataSource) : Boolean;
begin
  Result := True;
  try
   if not(dtSource.DataSet.Active) then
     dtSource.DataSet.Active := True;
   dtSource.DataSet.Open;
  except
   Result := False;
  end;
end;

function TBomba.Salvar(dtSource: TDataSource): Integer;
begin
  try
    dtSource.DataSet.Post;
    Result := dtSource.DataSet.FieldByName('ID').AsInteger;
  except
    Result := 0;
  end;
end;

end.
