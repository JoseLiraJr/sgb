unit uPesquisaController;

interface

uses
  Data.DB, System.SysUtils, Pesquisa;

type
  TPesquisaController = Class
  private
    FPesquisa : TPesquisa;
    procedure SetPesquisa(const Value: TPesquisa);
  public
    procedure Open(dtSources: array of TDataSource);
    procedure FiltraDados(dtSource : TDataSource);
    property Pesquisa : TPesquisa read FPesquisa write SetPesquisa;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPesquisa }

constructor TPesquisaController.Create;
begin
  Pesquisa := TPesquisa.Create;
  inherited Create;
end;

destructor TPesquisaController.Destroy;
begin
  Pesquisa.Free;
  inherited Destroy;
end;

procedure TPesquisaController.FiltraDados(dtSource: TDataSource);
begin
  if not(fPesquisa.FiltrarDados(dtSource)) then
    raise Exception.Create('Erro ao tentar filtrar dados na tabela de pesquisa');
end;

procedure TPesquisaController.Open(dtSources: array of TDataSource);
begin
  if not(fPesquisa.Open(dtSources)) then
    raise Exception.Create('Erro ao tentar abrir as tabelas do Sistema!');
end;

procedure TPesquisaController.SetPesquisa(const Value: TPesquisa);
begin
  FPesquisa := Value;
end;

end.
