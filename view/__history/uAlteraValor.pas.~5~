unit uAlteraValor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmAlteraValor = class(TForm)
    btnAlterar: TBitBtn;
    edtValor: TEdit;
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uVisualcontrol;

{$R *.dfm}

procedure TfrmAlteraValor.edtValorEnter(Sender: TObject);
begin
  ClearEdit(edtValor);
end;

procedure TfrmAlteraValor.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(CharNumbers(Key, edtValor.Text)) then
    Key := #0;
end;

end.
