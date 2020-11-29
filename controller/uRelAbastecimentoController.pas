unit uRelAbastecimentoController;

interface

uses
  Data.DB, System.SysUtils, RelAbastecimento;

type
  TRelAbastecimentoController = class
  private
    fRelAbastecimento : TRelAbastecimento;
  public
    procedure Open(dtSource : TDataSource);
    procedure GetDados(dtSource : TDataSource; tipo : Integer); overload;
    procedure GetDados(dtSource : TDataSource; tipo : Integer; dtIni, dtFim : TDate); overload;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRelAbastecimentoController }

constructor TRelAbastecimentoController.Create;
begin
  fRelAbastecimento := TRelAbastecimento.Create;
  inherited Create;
end;

destructor TRelAbastecimentoController.Destroy;
begin
  fRelAbastecimento.Free;
  inherited Destroy;
end;

procedure TRelAbastecimentoController.GetDados(dtSource: TDataSource;
  tipo: Integer; dtIni, dtFim: TDate);
begin
  if not(fRelAbastecimento.GetDados(dtSource, tipo, dtIni, dtFim)) then
    raise Exception.Create('Erro ao tentar filtrar dados na tabela do relat�rio');
end;

procedure TRelAbastecimentoController.GetDados(dtSource: TDataSource;
  tipo: Integer);
begin
  if (tipo in [0..2]) then
    begin
      if not(fRelAbastecimento.GetDados(dtSource, tipo)) then
       raise Exception.Create('Erro ao tentar filtrar dados na tabela do relat�rio');
    end;
end;

procedure TRelAbastecimentoController.Open(dtSource: TDataSource);
begin
 if not(fRelAbastecimento.open(dtSource)) then
   raise Exception.Create('Erro ao tentar abrir a tabela do relat�rio');
end;

end.