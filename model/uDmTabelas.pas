unit uDmTabelas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDmPrincipal;

type
  TdmTabelas = class(TDataModule)
    qryBombas: TFDQuery;
    qryAbastecimento: TFDQuery;
    dsBombas: TDataSource;
    dsAbastecimento: TDataSource;
    qryBombasID: TFDAutoIncField;
    qryBombasDESCRICAO: TStringField;
    qryBombasTP_COMBUSTIVEL: TIntegerField;
    qryAbastecimentoID: TFDAutoIncField;
    qryAbastecimentoID_BOMBA: TIntegerField;
    qryAbastecimentoVLR_LIQUIDO: TBCDField;
    qryAbastecimentoVLR_IMPOSTO: TBCDField;
    qryAbastecimentoVLR_TOTAL: TBCDField;
    qryAbastecimentoQTD_COMBUSTIVEL: TBCDField;
    qryAbastecimentoDT_ABASTECIMENTO: TDateField;
    qryBombasVLR_LITRO: TBCDField;
    qryAbastecimentoPERC_IMPOSTO: TBCDField;
    qryRelatorio: TFDQuery;
    dsRelatorio: TDataSource;
    qryRelatorioBomba: TStringField;
    qryRelatorioTipo: TWideStringField;
    qryRelatorioDt_Abastecimento: TDateField;
    qryRelatorioVlr_Lquido: TBCDField;
    qryRelatorioVlr_Imposto: TBCDField;
    qryRelatorioVlr_Total: TBCDField;
    qryRelatorioCod_Abastecimento: TFDAutoIncField;
    qryRelatorioCod_Bomba: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTabelas: TdmTabelas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmTabelas.DataModuleCreate(Sender: TObject);
begin
  qryBombas.Connection := TdmPrincipal.GetConnection.Conexao;
  qryAbastecimento.Connection := TdmPrincipal.GetConnection.Conexao;
  qryRelatorio.Connection := TdmPrincipal.GetConnection.Conexao;
end;

end.
