unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    btnAbastecimento: TSpeedButton;
    btnRelatorio: TSpeedButton;
    btnSobre: TSpeedButton;
    btnSair: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnBombas: TSpeedButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnBombasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAbastecimentoClick(Sender: TObject);
    procedure btnSobreClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uConexaoController, uCadBomba, uDmPrincipal, uAbastecimento, uSobre,
  uSelAbastecimentos, uPesquisa;

{$R *.dfm}

procedure TfrmPrincipal.btnAbastecimentoClick(Sender: TObject);
var
  frmAbastecimento: TfrmAbastecimento;
begin
  frmAbastecimento := TfrmAbastecimento.Create(Self);
  try
    frmAbastecimento.ShowModal;
  finally
    frmAbastecimento.Free;
  end;
end;

procedure TfrmPrincipal.btnBombasClick(Sender: TObject);
var
  frmCadBomba: TfrmCadBomba;
begin
  frmCadBomba := TfrmCadBomba.Create(Self);
  try
    frmCadBomba.ShowModal;
  finally
    frmCadBomba.Free;
  end;
end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
var
  frmPesquisa: TfrmPesquisa;
begin
  frmPesquisa := TfrmPesquisa.Create(Self);
  try
    frmPesquisa.ShowModal;
  finally
    frmPesquisa.Free;
  end;
end;

procedure TfrmPrincipal.btnRelatorioClick(Sender: TObject);
var
  frmSelAbastecimentos: TfrmSelAbastecimentos;
begin
  frmSelAbastecimentos := TfrmSelAbastecimentos.Create(Self);
  try
    frmSelAbastecimentos.ShowModal;
  finally
    frmSelAbastecimentos.Free;
  end;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnSobreClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSobre, frmSobre);
  frmSobre.ShowModal;
  FreeAndNil(frmSobre);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Application.MessageBox('Deseja realmente sair do Sistema?', 'Encerrar Aplica��o', MB_ICONQUESTION + MB_YESNO) = mrYes) then
    Action := caFree
  else
    Action := caNone;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  ConexaoCto : TConexaoController;
  msg, msgFinal : string;
  criouDados : Boolean;
begin
  //Setando o Caption do Form
  Caption := Application.Title;
  //Inicializando vari�veis
  msg := '';
  criouDados := False;
  msgFinal := 'Erro ao criar o Banco de Dados!' + sLineBreak + 'Descri��o do Erro: ';

  //Criando o Banco de Dados
  ConexaoCto := TConexaoController.Create;
  try
    criouDados := ConexaoCto.createData(msg);
    msgFinal := msgFinal + msg;
  finally
    ConexaoCto.Free;
    //Encerrando a Aplica��o caso haja erros na cria��o das tabelas.
    if not(criouDados) then
     begin
      Application.MessageBox(PChar(msgFinal) , 'Erro', MB_OK + MB_ICONERROR);
      Application.Terminate;
     end;
  end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  TdmPrincipal.Destroy;
end;

end.
