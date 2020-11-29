unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Comp.UI, FireDAC.Phys.SQLite;

type
  TdmPrincipal = class(TDataModule)
    Conexao: TFDConnection;
    DriverLink: TFDPhysSQLiteDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    Transacao: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    class var FConexao : TdmPrincipal;
  public
    { Public declarations }
    property Connection : TFDConnection read Conexao;
    class function GetConnection : TdmPrincipal;
    class procedure Destroy;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPrincipal }

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
  localDatabase : String;
begin
  localDatabase := ExtractFileDir(ParamStr(0)) + '\dados\dados.db';

  Conexao.DriverName := 'SQLite';
  Conexao.Params.Database := localDatabase;
end;

class procedure TdmPrincipal.Destroy;
begin
  if (Assigned(FConexao)) then
    FConexao.Free;
end;

class function TdmPrincipal.GetConnection: TdmPrincipal;
begin
  if not(Assigned(FConexao)) then
    FConexao := TdmPrincipal.Create(nil);
  Result := FConexao;
end;

end.
