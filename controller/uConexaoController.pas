unit uConexaoController;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.DApt;

type
  TConexaoController = class
   localAplicacao : string;
  public
  constructor Create;
  destructor Destroy; override;
  function createData(var msg : string) : Boolean;
  end;

implementation

uses
  uDmPrincipal;

{ TConexaoController }

constructor TConexaoController.Create;
begin
  inherited Create;
end;

function TConexaoController.createData(var msg : string): Boolean;
var
  query : TFDQuery;

begin
  Result := False;
  query := TFDQuery.Create(nil);
  try
    try
      query.Connection := TdmPrincipal.GetConnection.Conexao;

      //Criando a Tabela Bomba
      query.SQL.Clear;
      query.SQL.Add('CREATE TABLE IF NOT EXISTS BOMBA ( ');
      query.SQL.Add('ID INTEGER PRIMARY KEY AUTOINCREMENT, ');
      query.SQL.Add('DESCRICAO VARCHAR(50), ');
      query.SQL.Add('TP_COMBUSTIVEL INTEGER NOT NULL, ');
      query.SQL.Add('VLR_LITRO NUMERIC(10,2) )');
      query.ExecSQL;

      //Criando a Tabela Abastecimento
      query.SQL.Clear;
      query.SQL.Add('CREATE TABLE IF NOT EXISTS ABASTECIMENTO ( ');
      query.SQL.Add('ID INTEGER PRIMARY KEY AUTOINCREMENT, ');
      query.SQL.Add('ID_BOMBA INTEGER NOT NULL, ');
      query.SQL.Add('PERC_IMPOSTO NUMERIC(10,4) NOT NULL, ');
      query.SQL.Add('VLR_LIQUIDO NUMERIC(10,2) NOT NULL, ');
      query.SQL.Add('VLR_IMPOSTO NUMERIC(10,2) NOT NULL, ');
      query.SQL.Add('VLR_TOTAL NUMERIC(10,2) NOT NULL, ');
      query.SQL.Add('QTD_COMBUSTIVEL NUMERIC(10,3) NOT NULL, ');
      query.SQL.Add('DT_ABASTECIMENTO DATE NOT NULL, ');
      query.SQL.Add('FOREIGN KEY (ID_BOMBA) REFERENCES BOMBA(ID))');
      query.ExecSQL;

      Result := True;
    except
      on e : Exception do
       begin
         msg := e.Message;
         Result := False;
       end;
    end;
  finally
    query.Free;
  end;
end;

destructor TConexaoController.Destroy;
begin
  inherited Destroy;
end;

end.
