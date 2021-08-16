program Server1;

uses
  Vcl.Forms,
  U_ServidorRDW in 'U_ServidorRDW.pas' {Fserver},
  U_DMServer in 'U_DMServer.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFserver, Fserver);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
