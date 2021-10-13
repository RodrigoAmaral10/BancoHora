unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, SkinAlterdata, cxControls, cxContainer, cxEdit, cxLabel,
  StdCtrls, cxButtons, ExtCtrls, DB, MemDS, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider, cxTextEdit;

type
  TForm4 = class(TForm)
    pnl1: TPanel;
    btnIniciar: TcxButton;
    cxlbl1: TcxLabel;
    cxlblCronometro: TcxLabel;
    tmrCronometro: TTimer;
    cxlblInicio: TcxLabel;
    btnPausar: TcxButton;
    pstgrsqlnprvdr1: TPostgreSQLUniProvider;
    con1: TUniConnection;
    UniQuery1: TUniQuery;
    cxtTempo: TcxTextEdit;

    procedure tmrCronometroTimer(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPausarClick(Sender: TObject);
    
  private
    FTempoLanche : TDateTime;
  end;

implementation

uses DateUtils, alterdata, Unit2, Unit1;

{$R *.dfm}

procedure TForm4.tmrCronometroTimer(Sender: TObject);
var
  lHoras, lMinutos, lSegundos, lMiliSsegundos : Word;
begin
  DecodeTime(FTempoLanche, lHoras, lMinutos, lSegundos, lMiliSsegundos);
  cxlblCronometro.Caption := StrZero(IntToStr(lMinutos), 2) + ':' + StrZero(IntToStr(lSegundos), 2);
  FTempoLanche:= IncSecond(FTempoLanche, + 1);
end;

procedure TForm4.btnIniciarClick(Sender: TObject);
var
  lHora : TDateTime;
  lInicioLanche, lFimLanche: String;
begin
  lHora := Now();
  lInicioLanche := FormatDateTime('hh:mm:00', lHora);
  cxlblInicio.Caption := 'Horário Inicial: ' + lInicioLanche;

  if (btnIniciar.Caption = 'Iniciar') then
    begin
      btnIniciar.Caption := 'Encerrar';
      tmrCronometro.Enabled := True;
    end
  else
    if (btnIniciar.Caption = 'Encerrar') then
    begin
      if MessageDlg('Certeza que deseja encerrar seu intervalo de Lanche?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          tmrCronometro.Enabled := False;
          lFimLanche := cxlblCronometro.Caption;
          cxtTempo.Text := '00:' + lFimLanche;

           UniQuery1.SQL.Add(Format('update public."Funcionario" set "intervalolanche" = %s where "id" = ''%s''',
            [QuotedStr(cxtTempo.Text), IntToStr(Form2.lTelaConfiguracoes.FidFuncionario)]));
          UniQuery1.ExecSQL;

          Close();
        end;

      Form2.btnLanche.Enabled := False;
    end;
end;

procedure TForm4.btnPausarClick(Sender: TObject);
begin
  if (btnPausar.Caption = 'Pausar') then
    begin
      btnPausar.Caption := 'Continuar';
      tmrCronometro.Enabled := False;
    end
  else
    if (btnPausar.Caption = 'Continuar') then
    begin
      btnPausar.Caption := 'Pausar';
      tmrCronometro.Enabled := True;
    end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  FTempoLanche := 0;
  FTempoLanche:= IncMinute(FTempoLanche, 0);
end;

end.
