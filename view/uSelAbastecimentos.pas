unit uSelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, uDmTabelas, uRelAbastecimentoController;

type
  TfrmSelAbastecimentos = class(TForm)
    pnBody: TPanel;
    pnBottom: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gbPeriodo: TGroupBox;
    edtInicio: TDateTimePicker;
    edtFinal: TDateTimePicker;
    cbTodoPeriodo: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    rgTipoCombustivel: TRadioGroup;
    procedure cbTodoPeriodoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    dmTabelas : TdmTabelas;
    relAbastacimentoCto : TRelAbastecimentoController;
    procedure GetDados;
  public
    { Public declarations }
  end;

implementation

uses
  uVisualControl, uRelAbastecimentos;

{$R *.dfm}

procedure TfrmSelAbastecimentos.btnConfirmarClick(Sender: TObject);
var
  frmRelAbastecimentos: TfrmRelAbastecimentos;
begin
  frmRelAbastecimentos := TfrmRelAbastecimentos.Create(Self);
  try
    GetDados;
    frmRelAbastecimentos.RepAbastecimentos.DataSource := dmTabelas.dsRelatorio;
    frmRelAbastecimentos.RepAbastecimentos.PreviewModal;
  finally
    frmRelAbastecimentos.Free;
  end;
end;

procedure TfrmSelAbastecimentos.cbTodoPeriodoClick(Sender: TObject);
begin
  EnableControls(gbPeriodo, not(cbTodoPeriodo.Checked));
end;

procedure TfrmSelAbastecimentos.FormCreate(Sender: TObject);
begin
  dmTabelas := TdmTabelas.Create(Self);
  relAbastacimentoCto := TRelAbastecimentoController.Create;
end;

procedure TfrmSelAbastecimentos.FormDestroy(Sender: TObject);
begin
  relAbastacimentoCto.Free;
  dmTabelas.Free;
end;

procedure TfrmSelAbastecimentos.GetDados;
begin
  relAbastacimentoCto.Open(dmTabelas.dsRelatorio);
  if cbTodoPeriodo.Checked then
   relAbastacimentoCto.GetDados(dmTabelas.dsRelatorio, rgTipoCombustivel.ItemIndex)
  else
   relAbastacimentoCto.GetDados(dmTabelas.dsRelatorio, rgTipoCombustivel.ItemIndex,
                                edtInicio.Date, edtFinal.Date);
end;

end.
