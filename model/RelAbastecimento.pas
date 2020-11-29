unit RelAbastecimento;

interface

uses
  Data.DB, System.SysUtils;

type
  TRelAbastecimento = class
  public
    function Open(dtSource : TDataSource) : Boolean;
    function GetDados(dtSource : TDataSource; tipo : Integer) : Boolean; overload;
    function GetDados(dtSource : TDataSource; tipo : Integer; dtIni, dtFim : TDate) : Boolean; overload;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRelAbastecimento }

constructor TRelAbastecimento.Create;
begin
  Inherited Create;
end;

destructor TRelAbastecimento.Destroy;
begin
  inherited Destroy;
end;

function TRelAbastecimento.GetDados(dtSource: TDataSource; tipo: Integer; dtIni,
  dtFim: TDate): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Filtered := False;
    dtSource.DataSet.Filter := '';
    case tipo of
      0 : dtSource.DataSet.Filter := 'Tipo = ''Gasolina'' and ';
      1 : dtSource.DataSet.Filter := 'Tipo = ''Diesel'' and ';
      2 : dtSource.DataSet.Filter := 'Tipo = ''�lcool'' and ';
    end;
    dtSource.DataSet.Filter := dtSource.DataSet.Filter + 'Dt_Abastecimento >= ' +
                               QuotedStr(DateToStr(dtIni)) + ' and Dt_Abastecimento <= ' +
                               QuotedStr(DateToStr(dtFim));
    dtSource.DataSet.Filtered := True;
  except
    Result := False;
  end;
end;

function TRelAbastecimento.GetDados(dtSource: TDataSource;
  tipo: Integer): Boolean;
begin
  Result := True;
  try
    dtSource.DataSet.Filtered := False;
    case tipo of
      0 : dtSource.DataSet.Filter := 'Tipo = ''Gasolina'' ';
      1 : dtSource.DataSet.Filter := 'Tipo = ''Diesel'' ';
      2 : dtSource.DataSet.Filter := 'Tipo = ''�lcool'' ';
    end;
    dtSource.DataSet.Filtered := True;
  except
    Result := False;
  end;
end;

function TRelAbastecimento.Open(dtSource: TDataSource): Boolean;
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

end.
