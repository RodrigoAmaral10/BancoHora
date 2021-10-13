object Form1: TForm1
  Left = 731
  Top = 413
  Width = 233
  Height = 270
  Align = alCustom
  Caption = 'Tela Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnEntrar: TcxButton
    Left = 71
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 4
    OnClick = btnEntrarClick
  end
  object cxlbl1: TcxLabel
    Left = 12
    Top = 36
    Caption = 'Usu'#225'rio'
  end
  object cxlbl2: TcxLabel
    Left = 12
    Top = 81
    Caption = 'Email:'
  end
  object cxlbl3: TcxLabel
    Left = 17
    Top = 10
    Caption = 'Bem vindo! Fa'#231'a o Login'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxrJornada: TcxRadioGroup
    Left = 12
    Top = 133
    Caption = 'Jornada'
    Properties.Columns = 3
    Properties.Items = <
      item
        Caption = '4 horas'
        Value = 4
      end
      item
        Caption = '6 horas'
        Value = 6
      end
      item
        Caption = '8 horas'
        Value = 8
      end>
    ItemIndex = 2
    TabOrder = 2
    Height = 43
    Width = 194
  end
  object cxtEmail: TcxTextEdit
    Left = 12
    Top = 97
    TabOrder = 1
    Width = 196
  end
  object cxtUsuario: TcxTextEdit
    Left = 12
    Top = 52
    TabOrder = 0
    Width = 196
  end
  object con1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'BANCO_HORA_RODRIGO'
    Username = 'postgres'
    Password = '123456'
    Server = 'localhost'
    Connected = True
    Left = 7
    Top = 190
  end
  object pstgrsqlnprvdr1: TPostgreSQLUniProvider
    Left = 148
    Top = 190
  end
  object UniQuery1: TUniQuery
    Connection = con1
    Left = 39
    Top = 189
  end
  object FormStorage: TFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'cxtUsuario.Text'
      'cxtEmail.Text'
      'cxrJornada.ItemIndex')
    StoredValues = <>
    Left = 182
    Top = 190
  end
end
