program ConvertScritta;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
