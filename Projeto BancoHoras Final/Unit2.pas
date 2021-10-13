unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxGroupBox, cxRadioGroup, Menus, cxLabel,
  cxTextEdit, StdCtrls, cxButtons, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxClasses, dxRibbon, ExtCtrls, ImgList, dxSkinsForm, UniProvider,
  PostgreSQLUniProvider, DB, MemDS, DBAccess, Uni, dxSkinsCore,
  SkinAlterdata, Unit1;

type
  TForm2 = class(TForm)
    cxgrpbx1: TcxGroupBox;
    cxrPeriodoTrabalho: TcxRadioGroup;
    btnIniciar: TcxButton;
    btnEncerrar: TcxButton;
    mm1: TMainMenu;
    Opes1: TMenuItem;
    FazerLogoff1: TMenuItem;
    ConfiguraoOpes1: TMenuItem;
    EditarCampo1: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    con1: TUniConnection;
    UniQuery1: TUniQuery;
    pstgrsqlnprvdr1: TPostgreSQLUniProvider;
    cxtInicioExpediente: TcxTextEdit;
    cxlbl3: TcxLabel;
    cxlblVoltaAlmoo: TcxLabel;
    cxtInicioAlmoco: TcxTextEdit;
    cxlbl4: TcxLabel;
    cxtFimAlmoco: TcxTextEdit;
    cxtFimExpediente: TcxTextEdit;
    cxlbl5: TcxLabel;
    cxlUsuario: TcxLabel;
    cxlEmail: TcxLabel;
    cxlJornada: TcxLabel;
    btnLanche: TcxButton;
    dxskncntrlr1: TdxSkinController;
    
    procedure FazerLogoff1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure btnLancheClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  public
     lTelaConfiguracoes: TForm1;
  end;

var
  Form2: TForm2;

implementation

uses Unit4, DateUtils;

{$R *.dfm}

procedure TForm2.FazerLogoff1Click(Sender: TObject);
begin
  lTelaConfiguracoes.ShowModal();
end;

procedure TForm2.btnIniciarClick(Sender: TObject);
var
  lHora : TDateTime;
  lHoraInicioTrabalho, lHoraInicioAlmoco : String;
begin
  Uniquery1.SQL.Text := '';
  
  lHora := Now();
  lHoraInicioTrabalho := FormatDateTime('dd/mm/yyyy hh:mm:00', lHora);
  lHoraInicioAlmoco := FormatDateTime('hh:mm:00', lHora);

  if cxrPeriodoTrabalho.ItemIndex = 0 then
  begin
    cxtInicioExpediente.Text := lHoraInicioTrabalho;

    UniQuery1.SQL.Add(Format('update public."Funcionario" set "inicioexpediente" = %s where "id"  = ''%s''',
      [QuotedStr(cxtInicioExpediente.Text), IntToStr(lTelaConfiguracoes.FidFuncionario)]));
    UniQuery1.ExecSQL;
    
    cxrPeriodoTrabalho.ItemIndex := 1;
  end
  else
    begin
      cxtInicioAlmoco.Text := lHoraInicioAlmoco;

      UniQuery1.SQL.Add(Format('update public."Funcionario" set "inicioalmoco" = %s where "id" = ''%s''',
        [QuotedStr(cxtInicioAlmoco.Text), IntToStr(lTelaConfiguracoes.FidFuncionario)]));

      UniQuery1.ExecSQL;

      btnIniciar.Enabled := False;
    end;
end;

procedure TForm2.btnEncerrarClick(Sender: TObject);
var
  lHora: TDateTime;
  lHoraFimExpediente, lHoraFimAlmoco : String;
begin
  Uniquery1.SQL.Text := '';

  lHora := Now();
  lHoraFimExpediente := FormatDateTime('dd/mm/yyyy hh:mm:00', lHora);
  lHoraFimAlmoco := FormatDateTime('hh:mm:00', lHora);

  if cxrPeriodoTrabalho.ItemIndex = 0 then
    begin
      if MessageDlg('Certeza que deseja encerrar seu expediente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        cxtFimExpediente.Text := lHoraFimExpediente;

        UniQuery1.SQL.Add(Format('update public."Funcionario" set "fimexpediente" = %s where "id" = ''%s''',
            [QuotedStr(cxtFimExpediente.Text), IntToStr(lTelaConfiguracoes.FidFuncionario)]));
          UniQuery1.ExecSQL;
          
        Application.Terminate;                          
      end;
    end
  else
    begin
      cxtFimAlmoco.Text := lHoraFimAlmoco;

      UniQuery1.SQL.Add(Format('update public."Funcionario" set "fimalmoco" = %s where "id" = ''%s''',
        [QuotedStr(cxtFimAlmoco.Text), IntToStr(lTelaConfiguracoes.FidFuncionario)]));
      UniQuery1.ExecSQL;

      cxrPeriodoTrabalho.ItemIndex := 0;
    end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm2.btnLancheClick(Sender: TObject);
var
  lTelaTempoLanche: TForm4;
begin
  lTelaTempoLanche := TForm4.Create(nil);

  try
    lTelaTempoLanche.ShowModal();
  finally
    FreeAndNil(lTelaTempoLanche);
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  lTelaConfiguracoes.ShowModal();
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  lTelaConfiguracoes := TForm1.Create(nil);
end;

end.
