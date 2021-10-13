unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel,
  Menus, StdCtrls, cxButtons, cxGroupBox, cxRadioGroup, cxCheckBox,
  UniProvider, PostgreSQLUniProvider, DB, MemDS, DBAccess, Uni, dxSkinsForm,
  dxSkinsCore, SkinAlterdata, rxPlacemnt, RXCtrls, AlterdataHints;

type
  TForm1 = class(TForm)
    cxlbl1: TcxLabel;
    cxlbl2: TcxLabel;
    cxtEmail: TcxTextEdit;
    btnEntrar: TcxButton;
    cxrJornada: TcxRadioGroup;
    con1: TUniConnection;
    pstgrsqlnprvdr1: TPostgreSQLUniProvider;
    UniQuery1: TUniQuery;
    cxlbl3: TcxLabel;
    cxtUsuario: TcxTextEdit;
    FormStorage: TFormStorage;

    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    procedure LerArquivoInicializacao;
    procedure DadosLogin();
    procedure DeletarJornardaNaoConcluida;
    function ExisteJornadaAbertaParaHoje: Boolean;
    function CamposValidos: Boolean;

  public
    FidFuncionario: Integer;

    procedure PegarId;
  end;

implementation

uses Unit2, Unit4 , DateUtils;

{$R *.dfm}

procedure TForm1.btnEntrarClick(Sender: TObject);
begin
  DeletarJornardaNaoConcluida();
  FormStorage.SaveFormPlacement();

  if (CamposValidos()) and (not ExisteJornadaAbertaParaHoje()) then
  begin
    Uniquery1.SQL.Text := '';

    UniQuery1.SQL.Add(Format('insert into public."Funcionario"("login", "email", "tempojornada") values (%s, %s, %s)',
      [QuotedStr(cxtUsuario.Text), QuotedStr(cxtEmail.Text), (cxrJornada.ActiveProperties.Items[cxrJornada.ItemIndex].Value )]));
    UniQuery1.ExecSQL;

    DadosLogin();

    ModalResult := mrOk;
  end;
  
  PegarId();
end;

procedure TForm1.PegarId();
begin
  Uniquery1.SQL.Text := '';

  UniQuery1.SQL.Add('select max(id) as id from public."Funcionario"');
  UniQuery1.Open;

  FidFuncionario := UniQuery1.Fields.fieldByName('id').AsInteger;
end;

procedure TForm1.DeletarJornardaNaoConcluida();
begin
  Uniquery1.SQL.Text := '';

  UniQuery1.SQL.add('delete from public."Funcionario" where (fimexpediente is null) ');
  UniQuery1.SQL.Add('and ((inicioexpediente <> ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Today)) + ') or (inicioexpediente is null))');

  UniQuery1.ExecSQL;
end;

function TForm1.ExisteJornadaAbertaParaHoje(): Boolean;
begin
  Uniquery1.SQL.Text := '';
  UniQuery1.SQL.Add('select id from public."Funcionario" where (fimexpediente is null) and (inicioexpediente = :DataDeHoje)');

  UniQuery1.ParamByName('DataDeHoje').AsDate := Today();
  
  UniQuery1.Open();

  Result := (UniQuery1.RecordCount > 0);
end;

function TForm1.CamposValidos(): Boolean;
begin
  Result := True;

  if cxtUsuario.Text = '' then
    begin
      ShowHintError(cxtUsuario, 'Preencha o campo de usuário');
      cxtUsuario.SetFocus;
      Result := False;
    end
  else
    if cxtEmail.Text = '' then
    begin
      ShowHintError(cxtEmail, 'Preencha o campo de Email');
      cxtEmail.SetFocus;
      Result := False;
    end;
end;

procedure TForm1.DadosLogin();
begin
  Form2.cxlUsuario.Caption := 'Colaborador: ' + cxtUsuario.Text;
  Form2.cxlEmail.Caption := 'Email: ' + cxtEmail.Text;
  Form2.cxlJornada.Caption := 'Jornada: ' + cxrJornada.ActiveProperties.Items[cxrJornada.ItemIndex].Caption;
end;

procedure TForm1.LerArquivoInicializacao();
begin
   FormStorage.IniFileName := Format('%s\ConfiguracoesBancoHoras.ini',[GetCurrentDir]);
   FormStorage.RestoreFormPlacement;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LerArquivoInicializacao();
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult <> mrOK then
    Application.Terminate();
end;

end.
