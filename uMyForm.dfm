object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'ScanAnalitic'
  ClientHeight = 652
  ClientWidth = 1045
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panLeft: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 652
    Align = alLeft
    Caption = 'panLeft'
    TabOrder = 0
    object Label31: TLabel
      Left = 1
      Top = 516
      Width = 263
      Height = 13
      Align = alBottom
      Alignment = taCenter
      Caption = #1051#1102#1076#1080' '#1074#1110#1076#1084#1086#1074#1085#1080#1082#1080
      ExplicitWidth = 89
    end
    object sShellTreeView1: TsShellTreeView
      Left = 1
      Top = 22
      Width = 263
      Height = 394
      Hint = #1044#1083#1103' '#1074#1080#1073#1086#1088#1091' '#1087#1072#1087#1082#1080' '#1076#1074#1072' '#1088#1072#1079#1080' '#1082#1083#1072#1094#1085#1091#1090#1080
      Align = alClient
      Indent = 19
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = sShellTreeView1DblClick
      Active = False
      ObjectTypes = [otFolders]
      Root = 'rfMyComputer'
      ShellListView = sShellListView1
      UseShellImages = True
      AutoRefresh = False
      ShowExt = seSystem
    end
    object sDirectoryEdit1: TsDirectoryEdit
      Left = 1
      Top = 1
      Width = 263
      Height = 21
      Align = alTop
      AutoSize = False
      MaxLength = 255
      TabOrder = 1
      Text = 'z:\03 '#1048#1085#1090#1077#1082'\'#1057#1082#1072#1085#1044#1086#1082#1091#1084'\-='#1044#1083#1103' '#1044#1078#1086#1081#1085#1090#1072'=-\'
      OnChange = sDirectoryEdit1Change
      OnDblClick = sDirectoryEdit1Change
      CheckOnExit = True
      Root = 'rfDesktop'
    end
    object sShellListView1: TsShellListView
      Left = 1
      Top = 416
      Width = 263
      Height = 100
      Align = alBottom
      ReadOnly = False
      Sorted = True
      HideSelection = False
      TabOrder = 2
      ViewStyle = vsReport
      ObjectTypes = [otFolders, otNonFolders]
      Root = 'rfMyComputer'
      ShellTreeView = sShellTreeView1
      ShowExt = seSystem
    end
    object Memo3: TMemo
      Left = 1
      Top = 529
      Width = 263
      Height = 97
      Align = alBottom
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object btnOtkaz: TButton
      Left = 1
      Top = 626
      Width = 263
      Height = 25
      Action = acBtnEnambleOtkaz
      Align = alBottom
      TabOrder = 4
      OnClick = btnOtkazClick
    end
  end
  object Panel2: TPanel
    Left = 717
    Top = 545
    Width = 163
    Height = 89
    TabOrder = 1
    Visible = False
  end
  object panAll: TPanel
    Left = 265
    Top = 0
    Width = 780
    Height = 652
    Align = alClient
    TabOrder = 2
    object prgsBar: TProgressBar
      Left = 1
      Top = 634
      Width = 778
      Height = 17
      Align = alBottom
      TabOrder = 0
    end
    object panRight: TPanel
      Left = 563
      Top = 1
      Width = 216
      Height = 633
      Align = alRight
      TabOrder = 1
      object Memo2: TMemo
        Left = 1
        Top = 409
        Width = 214
        Height = 112
        Align = alClient
        Lines.Strings = (
          #1040#1085#1072#1083#1110#1090#1110#1082#1072':')
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object panRightTop: TPanel
        Left = 1
        Top = 1
        Width = 214
        Height = 408
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 123
          Top = 171
          Width = 9
          Height = 13
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 125
          Top = 33
          Width = 44
          Height = 13
          Caption = #1046#1077#1088#1090#1074#1080':'
        end
        object Label11: TLabel
          Left = 118
          Top = 49
          Width = 51
          Height = 13
          Caption = #1053#1077#1046#1077#1088#1090#1074':'
        end
        object Label12: TLabel
          Left = 122
          Top = 66
          Width = 47
          Height = 13
          Caption = #1030#1085#1074#1072#1083#1110#1076#1080':'
        end
        object Label13: TLabel
          Left = 142
          Top = 85
          Width = 26
          Height = 13
          Caption = #1044#1110#1090#1080':'
        end
        object Label14: TLabel
          Left = 174
          Top = 33
          Width = 9
          Height = 13
          Caption = '...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label15: TLabel
          Left = 174
          Top = 49
          Width = 9
          Height = 13
          Caption = '...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label16: TLabel
          Left = 174
          Top = 66
          Width = 9
          Height = 13
          Caption = '...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label17: TLabel
          Left = 174
          Top = 83
          Width = 9
          Height = 13
          Caption = '...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label18: TLabel
          Left = 75
          Top = 209
          Width = 44
          Height = 13
          Caption = #1050#1083#1110#1108#1085#1090#1110#1074':'
        end
        object Label19: TLabel
          Left = 123
          Top = 190
          Width = 9
          Height = 13
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 44
          Top = 190
          Width = 72
          Height = 13
          Caption = #1042#1110#1076#1089#1082#1072#1085#1086#1074#1072#1085#1086':'
        end
        object Label20: TLabel
          Left = 21
          Top = 275
          Width = 111
          Height = 13
          Caption = #1059#1089#1100#1086#1075#1086' '#1082#1083#1110#1108#1085#1090#1110#1074'  '#1074' '#1052#1030#1057
        end
        object Label21: TLabel
          Left = 151
          Top = 275
          Width = 12
          Height = 13
          Caption = '...'
        end
        object Label22: TLabel
          Left = 15
          Top = 313
          Width = 117
          Height = 13
          Caption = #1055#1086#1074#1085#1110#1089#1090#1102' '#1087#1088#1086#1089#1082#1072#1085#1086#1074#1072#1085#1110
        end
        object Label23: TLabel
          Left = 151
          Top = 313
          Width = 12
          Height = 13
          Caption = '...'
        end
        object Label24: TLabel
          Left = 66
          Top = 332
          Width = 66
          Height = 13
          Caption = #1053#1077' '#1087#1086#1074#1085#1110#1089#1090#1102':'
        end
        object Label25: TLabel
          Left = 151
          Top = 332
          Width = 12
          Height = 13
          Caption = '...'
        end
        object Label26: TLabel
          Left = 150
          Top = 294
          Width = 12
          Height = 13
          Caption = '...'
        end
        object Label27: TLabel
          Left = 63
          Top = 351
          Width = 69
          Height = 13
          Caption = #1053#1077' '#1089#1082#1072#1085#1086#1074#1072#1085#1110':'
        end
        object Label28: TLabel
          Left = 151
          Top = 351
          Width = 12
          Height = 13
          Caption = '...'
        end
        object Label3: TLabel
          Left = 1
          Top = 294
          Width = 131
          Height = 13
          Caption = #1059#1089#1100#1086#1075#1086' '#1082#1083#1110#1108#1085#1090#1110#1074' '#1076#1083#1103' '#1089#1082#1072#1085#1072
        end
        object Label4: TLabel
          Left = 21
          Top = 256
          Width = 35
          Height = 13
          Caption = #1056#1077#1075#1110#1086#1085':'
        end
        object Label5: TLabel
          Left = 75
          Top = 256
          Width = 9
          Height = 13
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 123
          Top = 209
          Width = 9
          Height = 13
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 44
          Top = 171
          Width = 67
          Height = 13
          Caption = #1042#1089#1100#1086#1075#1086' '#1087#1072#1087#1086#1082
        end
        object Label8: TLabel
          Left = 102
          Top = 4
          Width = 67
          Height = 13
          Caption = #1050#1083#1110#1108#1085#1090#1080' '#1110' '#1089#1110#1084#39#1111':'
        end
        object Label9: TLabel
          Left = 174
          Top = 4
          Width = 9
          Height = 13
          Caption = '...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label29: TLabel
          Left = 126
          Top = 19
          Width = 42
          Height = 13
          Caption = #1050#1083#1110#1108#1085#1090#1080':'
        end
        object Label30: TLabel
          Left = 172
          Top = 19
          Width = 9
          Height = 13
          Caption = '...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label32: TLabel
          Left = 108
          Top = 102
          Width = 60
          Height = 13
          Caption = #1042#1110#1076#1082#1072#1079#1085#1080#1082#1080':'
        end
        object Label33: TLabel
          Left = 173
          Top = 102
          Width = 9
          Height = 13
          Caption = '...'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object btnAnRegions: TButton
          Left = 5
          Top = 379
          Width = 186
          Height = 25
          Action = acReginoAnaliz
          TabOrder = 0
          OnClick = btnAnRegionsClick
        end
        object btnNewScan: TButton
          Left = 5
          Top = 140
          Width = 179
          Height = 25
          Hint = #1071#1082#1097#1086' '#1085#1077' '#1072#1082#1090#1080#1074#1085#1072' '#1082#1085#1086#1087#1082#1072', '#1090#1086' '#1079#1083#1110#1074#1072' '#1085#1077' '#1074#1080#1073#1088#1072#1085' '#1082#1072#1090#1072#1083#1086#1075' '#1079' '#1089#1082#1072#1085#1072#1084#1080
          Caption = #1040#1085#1072#1083#1110#1079' '#1087#1072#1087#1086#1082' '#1089#1082#1072#1085#1091
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnNewScanClick
        end
        object btnImportBD: TButton
          Left = 5
          Top = 1
          Width = 92
          Height = 25
          Caption = #1030#1084#1087#1086#1088#1090' '#1079' '#1041#1044
          TabOrder = 2
          OnClick = btnImportBDClick
        end
        object btnClearBD: TButton
          Left = 6
          Top = 92
          Width = 93
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1041#1044
          TabOrder = 3
          OnClick = btnClearBDClick
        end
        object cbRayon: TsComboBox
          Left = 6
          Top = 225
          Width = 186
          Height = 21
          ItemIndex = -1
          TabOrder = 4
          Text = #1056#1077#1075#1110#1086#1085#1080
          OnChange = cbRayonChange
        end
      end
      object Memo4: TMemo
        Left = 1
        Top = 521
        Width = 214
        Height = 111
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          #1057#1083#1091#1078#1073#1086#1074#1072' '#1110#1085#1092#1072':'
          '')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 562
      Height = 633
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 2
      object dbClients: TDBGrid
        Left = 1
        Top = 1
        Width = 560
        Height = 79
        Align = alTop
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
      end
      object dbScansGrid: TDBGrid
        Left = 1
        Top = 80
        Width = 560
        Height = 90
        Align = alTop
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = #1050#1086#1076
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Num_ank'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FIO'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsOK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1044#1077#1082#1083#1072#1088#1072#1094#1080#1103
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1047#1076#1086#1088#1086#1074#1100#1077
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1048#1053#1053
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1054#1090#1095#1077#1090#1099' SOS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1054#1090#1095#1077#1090#1099' '#1055#1072#1090#1088#1086#1085#1072#1078#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1055#1072#1089#1087#1086#1088#1090
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1055#1077#1085#1089#1080#1086#1085#1085#1086#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1055#1086#1076#1087#1080#1089#1072#1085#1085#1072#1103' '#1040#1085#1082#1077#1090#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1086' '#1088#1086#1078#1076#1077#1085#1080#1080
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077' '#1086#1073' '#1086#1082#1072#1079#1072#1085#1080#1080' '#1091#1089#1083#1091#1075
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1057#1087#1088#1072#1074#1082#1072' '#1086' '#1044#1086#1093#1086#1076#1072#1093
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1060#1086#1088#1084#1072' '#1054#1094#1077#1085#1082#1080' '#1050#1050
            Visible = True
          end
          item
            Expanded = False
            FieldName = #1060#1086#1088#1084#1072' '#1057#1086#1075#1083#1072#1089#1080#1103
            Visible = True
          end>
      end
      object Memo1: TMemo
        Left = 1
        Top = 170
        Width = 560
        Height = 421
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 1
        Top = 591
        Width = 560
        Height = 41
        Align = alBottom
        TabOrder = 3
        DesignSize = (
          560
          41)
        object btnClear: TButton
          Left = 14
          Top = 11
          Width = 75
          Height = 25
          Action = acSaveToFile
          Caption = #1057#1090#1077#1088#1090#1080
          TabOrder = 0
          OnClick = btnClearClick
        end
        object btnSaveToFile: TButton
          Left = 363
          Top = 7
          Width = 179
          Height = 27
          Action = acSaveToFile
          Anchors = [akRight, akBottom]
          TabOrder = 1
          OnClick = btnSaveToFileClick
        end
      end
    end
    object cbOtkaz: TCheckBox
      Left = 569
      Top = 125
      Width = 160
      Height = 17
      Caption = #1074#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1074#1110#1076#1084#1086#1074#1085#1080#1082#1110#1074
      TabOrder = 3
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    FileName = 'ResultScan.txt'
    Filter = #39'Text files (*.txt)|*.TXT|Any file (*.*)|*.*'#39';'
    Left = 40
    Top = 34
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=G:\Dropbox\Delphi\t' +
      'reeFolder\Win32\Debug\Scan.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 120
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * From Clients')
    Left = 192
    Top = 88
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Clients'
    Left = 120
    Top = 88
    object ADOTable1obl: TWideStringField
      DisplayWidth = 15
      FieldName = 'obl'
    end
    object ADOTable1rayon: TWideStringField
      DisplayWidth = 20
      FieldName = 'rayon'
      Size = 30
    end
    object ADOTable1city: TWideStringField
      DisplayWidth = 20
      FieldName = 'city'
    end
    object ADOTable1Num_ank: TIntegerField
      DisplayWidth = 10
      FieldName = 'Num_ank'
    end
    object ADOTable1status: TWideStringField
      DisplayWidth = 10
      FieldName = 'status'
      Size = 10
    end
    object ADOTable1FIO: TWideStringField
      DisplayWidth = 22
      FieldName = 'FIO'
      Size = 60
    end
    object ADOTable1invalid: TWideStringField
      DisplayWidth = 5
      FieldName = 'invalid'
      Size = 5
    end
    object ADOTable1age: TIntegerField
      DisplayWidth = 10
      FieldName = 'age'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 128
    Top = 32
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Scans'
    Left = 128
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 128
    Top = 296
  end
  object qQuery: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 128
    Top = 352
  end
  object ActionList1: TActionList
    Left = 24
    Top = 160
    object acSaveToFile: TAction
      AutoCheck = True
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1074' '#1092#1072#1081#1083' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1080
      Checked = True
      OnUpdate = acSaveToFileUpdate
    end
    object acReginoAnaliz: TAction
      AutoCheck = True
      Caption = #1040#1085#1072#1083#1110#1079' '#1088#1077#1075#1110#1086#1085#1110#1074
      OnUpdate = acReginoAnalizUpdate
    end
    object acBtnEnambleOtkaz: TAction
      Caption = #1042#1085#1077#1089#1090#1080' '#1074' '#1073#1072#1079#1091' '#1086#1090#1082#1072#1079#1085#1080#1082#1110#1074
      OnUpdate = acBtnEnambleOtkazUpdate
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 224
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = JvAppIniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'Label30.Caption'
      'cbOtkaz.Checked')
    StoredValues = <>
    Left = 32
    Top = 288
  end
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'FolderScan.ini'
    SubStorages = <>
    Left = 32
    Top = 344
  end
  object tOtkazniki: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Otkazniki'
    Left = 208
    Top = 240
  end
  object qOtkazniki: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from Otkazniki where Otkazniki.Num_ankety = "1061"')
    Left = 208
    Top = 296
  end
  object MainMenu1: TMainMenu
    Left = 529
    Top = 352
    object N1: TMenuItem
      Caption = #1030#1084#1087#1086#1088#1090
      object N2: TMenuItem
        Caption = #1030#1084#1087#1086#1088#1090' '#1079' '#1041#1044
      end
      object N3: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1041#1044
      end
    end
    object N4: TMenuItem
      Caption = #1040#1085#1072#1083#1110#1090#1110#1082#1072
      object N5: TMenuItem
        Caption = #1040#1085#1072#1083#1110#1079' '#1087#1072#1087#1086#1082' '#1089#1082#1072#1085#1091
      end
      object N6: TMenuItem
        Caption = #1040#1085#1072#1083#1110#1079' '#1088#1077#1075#1110#1086#1085#1110#1074
      end
    end
  end
end
