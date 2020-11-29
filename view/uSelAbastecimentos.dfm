object frmSelAbastecimentos: TfrmSelAbastecimentos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Abastecimetntos'
  ClientHeight = 152
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnBody: TPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 117
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 120
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 41
    object gbPeriodo: TGroupBox
      Left = 129
      Top = 0
      Width = 204
      Height = 117
      Align = alClient
      Caption = 'Per'#237'odo.:'
      TabOrder = 0
      ExplicitLeft = 128
      ExplicitWidth = 197
      ExplicitHeight = 96
      object Label1: TLabel
        Left = 15
        Top = 15
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 15
        Top = 57
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object edtInicio: TDateTimePicker
        Left = 15
        Top = 29
        Width = 146
        Height = 21
        Hint = 'Data de in'#237'cio do relat'#243'rio'
        Date = 44163.000000000000000000
        Time = 0.857476689816394400
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object edtFinal: TDateTimePicker
        Left = 15
        Top = 71
        Width = 146
        Height = 21
        Hint = 'Data do fim do relat'#243'rio'
        Date = 44163.000000000000000000
        Time = 0.857476689816394400
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object cbTodoPeriodo: TCheckBox
        Left = 15
        Top = 96
        Width = 97
        Height = 17
        Hint = 'Relat'#243'rio de todo o per'#237'odo'
        Caption = 'Todo o per'#237'odo'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbTodoPeriodoClick
      end
    end
    object rgTipoCombustivel: TRadioGroup
      Left = 0
      Top = 0
      Width = 129
      Height = 117
      Hint = 'Filtra por tipo de combust'#237'vel'
      Align = alLeft
      Caption = 'Tipo de Combust'#237'vel.:'
      ItemIndex = 3
      Items.Strings = (
        'Gasolina'
        'Diesel'
        #193'lcool'
        'Todos')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ExplicitHeight = 96
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 117
    Width = 333
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 153
    ExplicitWidth = 410
    DesignSize = (
      333
      35)
    object btnConfirmar: TBitBtn
      Left = 82
      Top = 6
      Width = 120
      Height = 25
      Hint = 'Confirmar sele'#231#227'o do relat'#243'rio'
      Anchors = [akRight, akBottom]
      Caption = '&Confirmar'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnConfirmarClick
      ExplicitLeft = 159
      ExplicitTop = 12
    end
    object btnCancelar: TBitBtn
      Left = 206
      Top = 6
      Width = 120
      Height = 25
      Hint = 'Cancelar relat'#243'rio'
      Anchors = [akRight, akBottom]
      Caption = 'Ca&ncelar'
      Kind = bkCancel
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ExplicitLeft = 283
      ExplicitTop = 12
    end
  end
end
