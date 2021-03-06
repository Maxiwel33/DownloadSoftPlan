unit U_principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  REST.Types, REST.Client, REST.Authenticator.Basic, Data.Bind.Components,
  Data.Bind.ObjectScope,system.Json,uDWJsonObject,System.IOUtils;

type
  TForm1 = class(TForm)
    lyt_principal: TLayout;
    lyt_btn: TLayout;
    btn1: TButton;
    lyt1: TLayout;
    lv1: TListView;
    RESTClient: TRESTClient;
    ReqRDW: TRESTRequest;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btn1Click(Sender: TObject);
var
    jsonParam : TJSONObject;
    retJson : uDWJsonObject.TJSONValue;
    arqLocal : string;
    arqStream : TStringStream;
begin
    try
        jsonParam := TJSONObject.Create;
        jsonParam.AddPair('arquivo', 'arquivo.pdf');

        ReqRDW.Params.Clear;
        ReqRDW.Body.ClearBody;
        ReqRDW.Body.Add(jsonParam.ToString, ContentTypeFromString('application/json'));
        ReqRDW.Execute;

        if ReqRDW.Response.StatusCode <> 200 then
            ShowMessage('Erro ao baixar arquivo: ' + ReqRDW.Response.Content)
        else
        begin
            try
                retJson := uDWJsonObject.TJSONValue.Create;
                retJson.LoadFromJSON(ReqRDW.Response.Content);

                {$IFDEF MSWINDOWS}
                arqLocal := GetCurrentDir + '\arquivo-baixado-windows.pdf';
                {$ELSE}
                arqLocal := TPath.Combine(TPath.GetDocumentsPath, 'arquivo-baixado-mobile.pdf');
                {$ENDIF}

                arqStream := TStringStream.Create('');
                retJson.SaveToStream(arqStream);
                arqStream.SaveToFile(arqLocal);
            finally
                retJson.DisposeOf;
                arqStream.DisposeOf;
            end;
        end;
    finally
        jsonParam.DisposeOf;
    end;

end;

end.
