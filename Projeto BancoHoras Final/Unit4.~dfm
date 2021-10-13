object Form4: TForm4
  Left = 621
  Top = 309
  Width = 330
  Height = 215
  Caption = 'Intervalo Lanche'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 176
    Align = alClient
    TabOrder = 0
    object btnIniciar: TcxButton
      Left = 82
      Top = 110
      Width = 72
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 0
      OnClick = btnIniciarClick
    end
    object cxlbl1: TcxLabel
      Left = 82
      Top = 12
      Caption = 'Hor'#225'rio de Lanche'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxlblCronometro: TcxLabel
      Left = 113
      Top = 48
      Caption = '00:00'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -32
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = 3392542
      Style.IsFontAssigned = True
    end
    object cxlblInicio: TcxLabel
      Left = 8
      Top = 143
      Caption = 'Hor'#225'rio Inicial:'
    end
    object btnPausar: TcxButton
      Left = 160
      Top = 110
      Width = 75
      Height = 25
      Caption = 'Pausar'
      TabOrder = 4
      OnClick = btnPausarClick
    end
    object cxtTempo: TcxTextEdit
      Left = 8
      Top = 198
      TabOrder = 5
      Width = 121
    end
  end
  object tmrCronometro: TTimer
    Enabled = False
    OnTimer = tmrCronometroTimer
    Left = 280
    Top = 146
  end
  object pstgrsqlnprvdr1: TPostgreSQLUniProvider
    Left = 183
    Top = 146
  end
  object con1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'BANCO_HORA_RODRIGO'
    Username = 'postgres'
    Password = '123456'
    Server = 'localhost'
    Connected = True
    Left = 215
    Top = 146
  end
  object UniQuery1: TUniQuery
    Connection = con1
    Left = 249
    Top = 146
  end
end
