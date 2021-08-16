object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FileClient'
  ClientHeight = 428
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 13
    Top = 38
    Width = 26
    Height = 13
    Caption = 'Host'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 155
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Porta'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 13
    Width = 196
    Height = 13
    Caption = 'CONFIGURA'#199#195'O SERVIDOR RestDW'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 123
    Top = 79
    Width = 35
    Height = 13
    AutoSize = False
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 13
    Top = 79
    Width = 43
    Height = 13
    AutoSize = False
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 122
    Width = 56
    Height = 13
    Caption = 'COMANDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 225
    Top = 40
    Width = 48
    Height = 13
    Caption = 'TimeOut'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object eHost: TEdit
    Left = 13
    Top = 55
    Width = 136
    Height = 21
    TabOrder = 0
    Text = 'localhost'
  end
  object ePort: TEdit
    Left = 155
    Top = 55
    Width = 40
    Height = 21
    TabOrder = 1
    Text = '8082'
  end
  object edPasswordDW: TEdit
    Left = 123
    Top = 97
    Width = 100
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = 'testserver'
  end
  object edUserNameDW: TEdit
    Left = 13
    Top = 97
    Width = 100
    Height = 21
    TabOrder = 3
    Text = 'testserver'
  end
  object Button1: TButton
    Left = 8
    Top = 178
    Width = 119
    Height = 37
    Caption = 'Listar Arquivos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object lbLocalFiles: TListBox
    Left = 8
    Top = 221
    Width = 369
    Height = 200
    ItemHeight = 13
    TabOrder = 5
  end
  object Button2: TButton
    Left = 133
    Top = 178
    Width = 119
    Height = 37
    Caption = 'Downloads'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 258
    Top = 178
    Width = 119
    Height = 37
    Caption = 'Upload'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button3Click
  end
  object cmb_tmp: TComboBox
    Left = 224
    Top = 55
    Width = 113
    Height = 21
    TabOrder = 8
    Text = '1 minuto'
    Items.Strings = (
      '1 minuto'
      '2 minutos'
      '3 minutos'
      '5 minutos')
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 141
    Width = 369
    Height = 31
    TabOrder = 9
  end
  object pnl1: TPanel
    Left = 400
    Top = 0
    Width = 410
    Height = 428
    Align = alRight
    BevelOuter = bvNone
    Caption = 'pnl1'
    TabOrder = 10
    object dbgrd1: TDBGrid
      Left = 0
      Top = 76
      Width = 410
      Height = 311
      Align = alClient
      DataSource = ds1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgrd1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'ID'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'URL'
          Width = 184
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAINICIO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAFIM'
          Width = 75
          Visible = True
        end>
    end
    object pnl_Top: TPanel
      Left = 0
      Top = 0
      Width = 410
      Height = 76
      Align = alTop
      Caption = 'Dados de Download/Upload'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnl2: TPanel
      Left = 0
      Top = 387
      Width = 410
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = 33023
      ParentBackground = False
      TabOrder = 2
      object Gauge1: TGauge
        Left = 0
        Top = 0
        Width = 410
        Height = 41
        Align = alClient
        MaxValue = 50
        Progress = 0
        ExplicitLeft = 32
        ExplicitTop = 16
        ExplicitWidth = 100
        ExplicitHeight = 100
      end
    end
  end
  object edt1: TEdit
    Left = 248
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'edt1'
  end
  object RESTClientPooler1: TRESTClientPooler
    DataCompression = False
    Encoding = esUtf8
    hEncodeStrings = False
    Host = 'localhost'
    AuthenticationOptions.AuthorizationOption = rdwAOBasic
    AuthenticationOptions.OptionParams.AuthDialog = True
    AuthenticationOptions.OptionParams.CustomDialogAuthMessage = 'Protected Space...'
    AuthenticationOptions.OptionParams.Custom404TitleMessage = '(404) The address you are looking for does not exist'
    AuthenticationOptions.OptionParams.Custom404BodyMessage = '404'
    AuthenticationOptions.OptionParams.Custom404FooterMessage = 'Take me back to <a href="./">Home REST Dataware'
    AuthenticationOptions.OptionParams.Username = 'testserver'
    AuthenticationOptions.OptionParams.Password = 'testserver'
    ProxyOptions.BasicAuthentication = False
    ProxyOptions.ProxyPort = 0
    RequestTimeOut = 60000
    ConnectTimeOut = 3000
    ThreadRequest = False
    AllowCookies = False
    RedirectMaximum = 0
    HandleRedirects = False
    OnWork = RESTClientPooler1Work
    OnWorkBegin = RESTClientPooler1WorkBegin
    OnWorkEnd = RESTClientPooler1WorkEnd
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    BinaryRequest = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    Left = 133
    Top = 241
  end
  object OpenDialog1: TOpenDialog
    Title = 'Arquivo a enviar'
    Left = 184
    Top = 200
  end
  object DWClientEvents1: TDWClientEvents
    ServerEventName = 'TDM.dwSEArquivos'
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    RESTClientPooler = RESTClientPooler1
    Events = <
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovBlob
            ParamName = 'result'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'FileList'
        EventName = 'FileList'
        OnlyPreDefinedParams = False
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Arquivo'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Diretorio'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovBlob
            ParamName = 'FileSend'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovBoolean
            ParamName = 'Result'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'SendReplicationFile'
        EventName = 'SendReplicationFile'
        OnlyPreDefinedParams = False
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'Arquivo'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovBlob
            ParamName = 'Result'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'DownloadFile'
        EventName = 'DownloadFile'
        OnlyPreDefinedParams = False
      end>
    Left = 290
    Top = 273
  end
  object DTBase1: TRESTDWDataBase
    Active = False
    Compression = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    AuthenticationOptions.AuthorizationOption = rdwAOBasic
    AuthenticationOptions.OptionParams.AuthDialog = True
    AuthenticationOptions.OptionParams.CustomDialogAuthMessage = 'Protected Space...'
    AuthenticationOptions.OptionParams.Custom404TitleMessage = '(404) The address you are looking for does not exist'
    AuthenticationOptions.OptionParams.Custom404BodyMessage = '404'
    AuthenticationOptions.OptionParams.Custom404FooterMessage = 'Take me back to <a href="./">Home REST Dataware'
    AuthenticationOptions.OptionParams.Username = 'testserver'
    AuthenticationOptions.OptionParams.Password = 'testserver'
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = '127.0.0.1'
    PoolerPort = 8082
    PoolerName = 'TDM.RESTDWPoolerDB'
    StateConnection.AutoCheck = False
    StateConnection.InTime = 1000
    RequestTimeOut = 10000
    ConnectTimeOut = 3000
    EncodeStrings = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    HandleRedirects = False
    RedirectMaximum = 0
    ParamCreate = True
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    ClientConnectionDefs.Active = False
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    Left = 248
    Top = 88
  end
  object DWSQL_Downloads: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftFMTBcd
        Size = 4
      end
      item
        Name = 'URL'
        DataType = ftString
        Size = 600
      end
      item
        Name = 'DATAINICIO'
        DataType = ftDate
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = False
    MasterCascadeDelete = True
    BinaryRequest = False
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DTBase1
    SQL.Strings = (
      'Select * From LOGDOWNLOAD')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 320
    Top = 88
  end
  object ds1: TDataSource
    DataSet = DWSQL_Downloads
    Left = 488
    Top = 264
  end
end
