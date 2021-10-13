object Form2: TForm2
  Left = 543
  Top = 425
  Width = 546
  Height = 233
  Caption = 'Banco de Horas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxgrpbx1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    TabOrder = 0
    Height = 174
    Width = 530
    object cxrPeriodoTrabalho: TcxRadioGroup
      Left = 11
      Top = 7
      Align = alCustom
      Caption = 'Per'#237'odo de Trabalho'
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Expediente'
          Value = 1
        end
        item
          Caption = 'Almo'#231'o'
          Value = 2
        end>
      ItemIndex = 0
      TabOrder = 0
      Height = 53
      Width = 237
    end
    object btnIniciar: TcxButton
      Left = 11
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 1
      OnClick = btnIniciarClick
    end
    object btnEncerrar: TcxButton
      Left = 92
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Encerrar'
      TabOrder = 2
      OnClick = btnEncerrarClick
    end
    object cxtFimExpediente: TcxTextEdit
      Left = 399
      Top = 143
      TabOrder = 3
      Width = 121
    end
    object cxtInicioExpediente: TcxTextEdit
      Left = 9
      Top = 143
      TabOrder = 4
      Width = 121
    end
    object cxtFimAlmoco: TcxTextEdit
      Left = 269
      Top = 143
      TabOrder = 5
      Width = 121
    end
    object cxtInicioAlmoco: TcxTextEdit
      Left = 139
      Top = 143
      TabOrder = 6
      Width = 121
    end
    object cxlbl3: TcxLabel
      Left = 9
      Top = 125
      Caption = 'Inicio do Expediente'
    end
    object cxlblVoltaAlmoo: TcxLabel
      Left = 139
      Top = 125
      Caption = 'Inicio do Almo'#231'o'
    end
    object cxlbl5: TcxLabel
      Left = 399
      Top = 126
      Caption = 'Fim do Expediente'
    end
    object cxlbl4: TcxLabel
      Left = 269
      Top = 125
      Caption = 'Fim do Almo'#231'o'
    end
    object cxlEmail: TcxLabel
      Left = 320
      Top = 24
      Caption = 'Email: '
    end
    object cxlJornada: TcxLabel
      Left = 320
      Top = 41
      Caption = 'Jornada:'
    end
    object cxlUsuario: TcxLabel
      Left = 321
      Top = 7
      Caption = 'Colaborador:'
    end
    object btnLanche: TcxButton
      Left = 173
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Lanchar'
      TabOrder = 14
      OnClick = btnLancheClick
    end
  end
  object mm1: TMainMenu
    Left = 317
    Top = 88
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      object FazerLogoff1: TMenuItem
        Caption = 'Fazer Logoff'
        OnClick = FazerLogoff1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ConfiguraoOpes1: TMenuItem
        Caption = 'Configura'#231#227'o Op'#231#245'es'
        object EditarCampo1: TMenuItem
          Caption = 'Editar Campo'
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
    end
  end
  object con1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'BANCO_HORA_RODRIGO'
    Username = 'postgres'
    Password = '123456'
    Server = 'localhost'
    Connected = True
    Left = 386
    Top = 88
  end
  object UniQuery1: TUniQuery
    Connection = con1
    Left = 421
    Top = 88
  end
  object pstgrsqlnprvdr1: TPostgreSQLUniProvider
    Left = 349
    Top = 88
  end
  object dxskncntrlr1: TdxSkinController
    SkinName = 'SkinAlterdata'
    Left = 453
    Top = 89
  end
end
