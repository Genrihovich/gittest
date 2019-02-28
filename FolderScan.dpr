program FolderScan;

uses
  Vcl.Forms,
  uMyForm in 'uMyForm.pas' {Form1},
  uMyExcel in 'uMyExcel.pas',
  jpeg2pdf in 'jpeg2pdf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
