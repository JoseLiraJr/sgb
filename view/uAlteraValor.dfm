object frmAlteraValor: TfrmAlteraValor
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'frmAlteraValor'
  ClientHeight = 48
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnAlterar: TBitBtn
    Left = 141
    Top = 11
    Width = 99
    Height = 25
    Align = alCustom
    Caption = '&Alterar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 0
  end
  object edtValor: TEdit
    Left = 13
    Top = 13
    Width = 121
    Height = 21
    Align = alCustom
    TabOrder = 1
    Text = 'edtValor'
    OnEnter = edtValorEnter
    OnKeyPress = edtValorKeyPress
  end
end
