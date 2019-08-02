unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.Buttons, StrUtils;

type
  TPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtFile: TButtonedEdit;
    ImageList1: TImageList;
    Panel2: TPanel;
    Panel3: TPanel;
    MmoArquivo: TMemo;
    OpenDlg: TOpenDialog;
    Panel4: TPanel;
    Panel5: TPanel;
    btnConvert: TBitBtn;
    btnExport: TBitBtn;
    SaveDialog1: TSaveDialog;
    ckA1: TCheckBox;
    ckB1: TCheckBox;
    ckB2: TCheckBox;
    ckJ1: TCheckBox;
    ckM1: TCheckBox;
    Label2: TLabel;
    procedure edtFileRightButtonClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure ckA1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Convertido: Boolean;
    procedure ConvertFile(AFileName: string);
    procedure LerArquivo(AFileName: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

procedure TPrincipal.ConvertFile(AFileName: string);
var
  I: Integer;
  Key, Linha: string;
  ListLinhas: TStringList;
begin
  ListLinhas := TStringList.Create;
  try
    if (not ckA1.Checked) and (not ckB1.Checked) and (not ckB2.Checked) and (not ckJ1.Checked) and (not ckM1.Checked) then
      raise Exception.Create('Selecione pelo menos um registro para ser exportado');

    for I := 0 to MmoArquivo.Lines.Count -1 do
    begin
      Linha := '';
      Key := Copy(MmoArquivo.Lines.Strings[I], 1, 2);
      if SameText(Key ,'A1') and ckA1.Checked then
      begin
        Linha := Copy(MmoArquivo.Lines.Strings[I], 1, 2);
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 03,  01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 04,  08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 012, 70));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 082, 40));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 122, 06));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 128, 20));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 148, 20));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 168, 20));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 188, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 190, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 198, 18));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 216, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 230, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 244, 08));
      end
      else
      if SameText(Key ,'B1') and ckB1.Checked then
      begin
        Linha := Copy(MmoArquivo.Lines.Strings[I], 1, 2);
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 3, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 4, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 5, 3));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 8, 3));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 11, 2));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 13, 9));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 22, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 36, 6));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 42, 8));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 50, 8));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 58, 8));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 66, 8));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 74, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 75, 5));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 80, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 81, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 95, 5));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 100, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 101, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 115, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 129, 5));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 134, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 135, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 149, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 163, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 177, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 178, 10));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 188, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 202, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 216, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 217, 22));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 245, 7));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 247, 2));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 259, 12));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 269, 10));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 277, 8));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 280, 3));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 281, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 282, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 283, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 284, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 334, 50));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 414, 80));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 419, 5));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 422, 3));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 431, 9));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 432, 1));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 433, 44));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 477, 2));
      end
      else
      if SameText(Key ,'B2') and ckB2.Checked then
      begin
        Linha := Copy(MmoArquivo.Lines.Strings[I], 1, 2);
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 003, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 004, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 005, 03));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 008, 03));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 011, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 013, 09));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 022, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 036, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 044, 13));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 057, 50));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 107, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 121, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 129, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 137, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 142, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 156, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 170, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 184, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 198, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 212, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 217, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 231, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 236, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 250, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 264, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 278, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 283, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 297, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 302, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 316, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 330, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 344, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 346, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 351, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 356, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 370, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 384, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 398, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 412, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 426, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 440, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 442, 03));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 445, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 450, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 464, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 478, 20));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 498, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 512, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 520, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 528, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 542, 06));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 548, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 562, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 576, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 590, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 604, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 618, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 619, 03));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 622, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 630, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 644, 02));
      end
      else
      if SameText(Key ,'J1') and ckJ1.Checked then
      begin
        Linha := Copy(MmoArquivo.Lines.Strings[I], 1, 2);
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 003, 001));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 004, 014));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 018, 060));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 078, 018));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 096, 014));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 110, 014));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 124, 014));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 138, 070));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 208, 040));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 248, 040));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 288, 008));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 296, 002));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 298, 008));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 306, 016));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 322, 016));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 338, 002));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 340, 001));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 341, 004));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 345, 100));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 445, 009));
      end
      else
      if SameText(Key ,'M1') and ckM1.Checked then
      begin
        Linha := Copy(MmoArquivo.Lines.Strings[I], 1, 2);
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 003, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 004, 13));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 017, 13));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 030, 50));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 080, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 088, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 096, 03));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 099, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 113, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 118, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 132, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 140, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 145, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 146, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 148, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 149, 03));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 152, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 157, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 162, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 167, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 181, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 186, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 200, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 202, 10));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 212, 04));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 216, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 217, 01));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 218, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 232, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 246, 14));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 260, 06));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 266, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 271, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 276, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 278, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 283, 05));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 288, 06));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 294, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 302, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 310, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 318, 08));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 326, 06));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 332, 10));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 342, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 344, 02));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 346, 60));
        Linha := Linha + ';' + Trim(Copy(MmoArquivo.Lines.Strings[I], 406, 01));
      end;
      if Linha <> '' then
        ListLinhas.Add(Linha);
    end;
    if ListLinhas.Text <> '' then
      MmoArquivo.Text := ListLinhas.Text;
    MmoArquivo.SelStart := 1;
    Convertido := True;
  finally
    FreeAndNil(ListLinhas);
  end;
end;

procedure TPrincipal.btnConvertClick(Sender: TObject);
begin
  if not Convertido then
  begin
    if not SameText(MmoArquivo.Lines.Text, '') then
      ConvertFile(MmoArquivo.Lines.Text)
    else
      Exception.Create('Selecione um arquivo para ser convertido');
  end
  else
  begin
    if MessageBox(0, 'Arquivo já convertido, deseja carregar as informações novamente?', '', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = mrYes then
    begin
      LerArquivo(edtFile.Text);
      ConvertFile(MmoArquivo.Lines.Text);
    end;
  end;
end;

procedure TPrincipal.btnExportClick(Sender: TObject);
var
  I: Integer;
  NewFileName, Reg: string;
begin
  if SameText(MmoArquivo.Text, '') then
    raise Exception.Create('Não existe informações para serem exportadas');

  if ckA1.Checked and ckB1.Checked and ckB2.Checked and ckJ1.Checked and ckM1.Checked then
    Reg := ''
  else
  begin
    if ckA1.Checked then
      Reg := IfThen(Reg='','',Reg+'_')+'A1';
    if ckB1.Checked then
      Reg := IfThen(Reg='','',Reg+'_')+'B1';
    if ckB2.Checked then
      Reg := IfThen(Reg='','',Reg+'_')+'B2';
    if ckJ1.Checked then
      Reg := IfThen(Reg='','',Reg+'_')+'J1';
    if ckM1.Checked then
      Reg := IfThen(Reg='','',Reg+'_')+'M1';
    Reg := '(' + Reg + ')';
  end;

  I := 0;
  NewFileName := ExtractFilePath(OpenDlg.FileName) + '\' + Copy(ExtractFileName(OpenDlg.FileName), 1, Length(ExtractFileName(OpenDlg.FileName))-4) + '_Convertido' + Reg + '.txt';
  while FileExists(NewFileName) do
  begin
    Inc(I);
    NewFileName := ExtractFilePath(OpenDlg.FileName) + '\' + Copy(ExtractFileName(OpenDlg.FileName), 1, Length(ExtractFileName(OpenDlg.FileName))-4) + '_Convertido' + Reg + '_' + IntToStr(I) + '.txt';
  end;
  MmoArquivo.Lines.SaveToFile(NewFileName);
  ShowMessage('Arquivo ' + NewFileName + ' gravado com sucesso !!!');
end;

procedure TPrincipal.ckA1Click(Sender: TObject);
begin
  if not SameText(edtFile.Text, '') and FileExists(edtFile.Text) then
  begin
    Convertido := False;
    LerArquivo(edtFile.Text);
  end;
end;

procedure TPrincipal.edtFileRightButtonClick(Sender: TObject);
begin
  if OpenDlg.Execute then
  begin
    MmoArquivo.Lines.Clear;
    edtfile.Text := OpenDlg.FileName;
    LerArquivo(edtfile.Text);
    Convertido := False;
  end;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  Convertido := False;
end;

procedure TPrincipal.LerArquivo(AFileName: string);
var
  Arq: TextFile;
  Linha, Key: string;
  ListLinhas: TStringList;
begin
  MmoArquivo.Lines.Clear;
  if ckA1.Checked and ckB1.Checked and ckB2.Checked and ckJ1.Checked and ckM1.Checked then
    MmoArquivo.Lines.LoadFromFile(AFileName)
  else
  begin
    ListLinhas := TStringList.Create;
    try
      AssignFile(Arq, AFileName);
      {$I-}
      Reset(Arq);
      {$I+}

      if (IOResult <> 0) then
      begin
        MmoArquivo.Lines.Add('Erro na abertura do arquivo !!!');
      end
      else
      begin
        while (not eof(Arq)) do
        begin
          Readln(arq, Linha);
          Key := Copy(Linha, 1, 2);
          if SameText(Key ,'A1') and ckA1.Checked then
            ListLinhas.Add(Linha);
          if SameText(Key ,'B1') and ckB1.Checked then
            ListLinhas.Add(Linha);
          if SameText(Key ,'B2') and ckB2.Checked then
            ListLinhas.Add(Linha);
          if SameText(Key ,'J1') and ckJ1.Checked then
            ListLinhas.Add(Linha);
          if SameText(Key ,'M1') and ckM1.Checked then
            ListLinhas.Add(Linha);
        end;
        MmoArquivo.Text := ListLinhas.Text;
      end;
    finally
      CloseFile(Arq);
      ListLinhas.Free;
    end;
  end;
  MmoArquivo.SelStart := 1;
end;

end.
