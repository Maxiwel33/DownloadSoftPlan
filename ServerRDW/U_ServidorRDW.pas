unit U_ServidorRDW;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWBase, RxGIF,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, RxAnimate, RxGIFCtrl, Vcl.ComCtrls,
  uRESTDWServerEvents, uDWConsts, uDWJSONObject,System.Json, JvExControls,
  JvAnimatedImage, JvGIFCtrl;

type
  TFserver = class(TForm)
    RESTServicePooler1: TRESTServicePooler;
    pnl1: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl2: TPanel;
    btn_start: TBitBtn;
    btn_stop: TBitBtn;
    btnFechar: TBitBtn;
    tmr1: TTimer;
    mmo_Request: TMemo;
    mmo_response: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    JvGIFAnimator1: TJvGIFAnimator;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    pnl5: TPanel;
    chkEncode: TCheckBox;
    edtPasswordDW: TEdit;
    edtUserNameDW: TEdit;
    edtPortaDW: TEdit;
    chkPoolerState: TCheckBox;
    lstlbllocalfiles: TListBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure RESTServicePooler1LastRequest(Value: string);
    procedure RESTServicePooler1LastResponse(Value: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private

  FLastResponse: string;
  FLastResquest:string;
  procedure botoesacoes;
  procedure botoesdesabill;

    { Private declarations }
  public
   DirName : String;
   Procedure LoadLocalFiles;
      { Public declarations }
  end;
  Function GetFilesServer(Const List : TStrings) : Boolean;

var
  Fserver: TFserver;
   StartDir : String;

implementation

uses
  U_DMServer;


{$R *.dfm}

Function GetFilesServer(Const List : TStrings) : Boolean;
   procedure ScanFolder(const Path: String; List: TStrings);
  var
    sPath: string;
    rec : TSearchRec;
  begin
    sPath := IncludeTrailingPathDelimiter(Path);
    if FindFirst(sPath + '*.*', faAnyFile, rec) = 0 then
    begin
      repeat
        if (rec.Attr and faDirectory) <> 0 then
        begin
          if (rec.Name <> '.') and (rec.Name <> '..') then
            ScanFolder(IncludeTrailingPathDelimiter(sPath + rec.Name), List);
        end
        else
        begin
          if pos(StartDir, Path) > 0 then
            List.Add(copy(Path, length(StartDir) + 1, length(path)) + rec.Name)
          else
            List.Add(Path + rec.Name);
        end;
      until FindNext(rec) <> 0;
      FindClose(rec);
    end;
  end;
Begin
 If Not Assigned(List) Then
  Begin
    Result := False;
    Exit;
  end;
  ScanFolder(StartDir, List);
  Result := (List.Count > 0);
End;

procedure TFserver.btn_startClick(Sender: TObject);
var
portas:Integer;
ativo:Boolean;
begin
    portas:=RESTServicePooler1.ServicePort;
    RESTServicePooler1.Active:=True;
    LoadLocalFiles;

    botoesacoes;
    jvGIFAnimator1.Animate:=True;
    pnl1.Font.Color:=clWhite;
    pnl1.Font.size:=30;
    pnl1.Caption:='Servidor Online ';

    RESTServicePooler1.ServicePort:=portas;

    lbl5.Caption:=IntToStr(portas);

    lbl6.Caption:=RESTServicePooler1.VersionInfo;

    tmr1.Enabled:=RESTServicePooler1.Active;

end;

procedure TFserver.btn_stopClick(Sender: TObject);
begin
 RESTServicePooler1.Active:=false;
 lstlbllocalfiles.Clear;
 botoesdesabill;
 jvGIFAnimator1.Animate:=false;


 pnl1.Font.Color:=clYellow;
 pnl1.Font.size:=30;
 pnl1.Caption:='Servidor OffLine ';
end;

procedure TFserver.botoesacoes;
begin

 btn_start.Enabled :=False;
 btn_stop.Enabled:=true ;
 btnFechar.Enabled:=False;

 end;

procedure TFserver.botoesdesabill;
begin
  btn_start.Enabled :=True;
 btn_stop.Enabled:=false;
 btnFechar.Enabled:=true;
end;

procedure TFserver.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TFserver.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose:= not RESTServicePooler1.Active;
    if CanClose then
    CanClose:=  Application.MessageBox('Voce eseja encerra a aplicação?','Atenção',MB_ICONQUESTION + MB_YESNO)= mrYes;
end;

procedure TFserver.FormCreate(Sender: TObject);
begin
RESTServicePooler1.ServerMethodClass:=TDm;

 FLastResquest:='';
 FLastResponse:='';
 tmr1.Enabled:=False;

 //ts1.TabVisible:=False;
 //ts2.TabVisible:=False;


  btn_stop.Enabled:=False;

end;


procedure TFserver.LoadLocalFiles;
Var
 List    : TStringList;
 I       : Integer;
Begin
 lstlbllocalfiles.Clear;
 List     := TStringList.Create;
 DirName  := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
             IncludeTrailingPathDelimiter('filelist');
 StartDir := DirName;
 If Not DirectoryExists(DirName) Then
  ForceDirectories(DirName);
  If GetFilesServer(List) Then
  Begin
   For I := 0 To List.Count -1 Do
    lstlbllocalfiles.AddItem(List[I], Nil);
  End;
 List.Free;
end ;

procedure TFserver.RESTServicePooler1LastRequest(Value: string);
begin
FLastResquest:= Copy (Value,1,100);
end;

procedure TFserver.RESTServicePooler1LastResponse(Value: string);
begin
FLastResponse:= Copy (Value,1,100);
end;

procedure TFserver.tmr1Timer(Sender: TObject);

begin
   tmr1.Enabled:=False;
   try
     //Requisição
     if (FLastResquest <> '') then
     begin
       if (mmo_Request.Lines.Count >= 150) then
           mmo_Request.Lines.Clear;

           mmo_Request.Lines.Add(FLastResquest);
           mmo_Request.Lines.Add(StringOfChar('-',100));
     end;

          //Resposta
     if (FLastResponse <> '') then
     begin
       if (mmo_response.Lines.Count >= 100) then
           mmo_response.Lines.Clear;

           mmo_response.Lines.Add(FLastResponse);
           mmo_response.Lines.Add(StringOfChar('-',145));
           end;
   finally
         FLastResquest:='';
         FLastResponse:='';
         tmr1.Enabled:=True;
   end;
end;

end.
