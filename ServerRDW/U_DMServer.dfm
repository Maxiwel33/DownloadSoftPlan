object DM: TDM
  OldCreateOrder = False
  Encoding = esUtf8
  Height = 305
  Width = 463
  object dwSEArquivos: TDWServerEvents
    IgnoreInvalidParams = False
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
            Alias = 'result'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'FileList'
        EventName = 'FileList'
        OnlyPreDefinedParams = False
        OnReplyEvent = dwSEArquivosEventsFileListReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmDataware
        Name = 'SendReplicationFile'
        EventName = 'SendReplicationFile'
        OnlyPreDefinedParams = False
        OnReplyEvent = dwSEArquivosEventsSendReplicationFileReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmDataware
        Name = 'DownloadFile'
        EventName = 'DownloadFile'
        OnlyPreDefinedParams = False
        OnReplyEvent = dwSEArquivosEventsDownloadFileReplyEvent
      end>
    ContextName = 'se1'
    Left = 200
    Top = 120
  end
  object Conn1: TFDConnection
    Params.Strings = (
      'Database=C:\SoftPlan\Banco\dados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 296
    Top = 32
  end
  object RESTDWDriverFD: TRESTDWDriverFD
    CommitRecords = 100
    Connection = Conn1
    Left = 56
    Top = 96
  end
  object RESTDWPoolerDB: TRESTDWPoolerDB
    RESTDriver = RESTDWDriverFD
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 56
    Top = 152
  end
end
