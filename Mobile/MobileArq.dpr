program MobileArq;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_principal in 'U_principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
