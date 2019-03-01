unit uMyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, sTreeView, acShellCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit,
  Vcl.ExtDlgs, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  System.Actions, Vcl.ActnList, sComboBox, sListView, JvAppStorage,
  JvAppIniStorage, JvComponentBase, JvFormPlacement, MemTableDataEh, MemTableEh,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    sShellTreeView1: TsShellTreeView;
    sDirectoryEdit1: TsDirectoryEdit;
    panLeft: TPanel;
    Memo1: TMemo;
    prgsBar: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnSaveToFile: TButton;
    SaveTextFileDialog1: TSaveTextFileDialog;
    ADOConnection1: TADOConnection;
    dbClients: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    ADOTable1Num_ank: TIntegerField;
    ADOTable1obl: TWideStringField;
    ADOTable1rayon: TWideStringField;
    ADOTable1city: TWideStringField;
    ADOTable1status: TWideStringField;
    ADOTable1FIO: TWideStringField;
    ADOTable1invalid: TWideStringField;
    ADOTable1age: TIntegerField;
    btnImportBD: TButton;
    OpenDialog1: TOpenDialog;
    btnClearBD: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btnNewScan: TButton;
    ADOTable2: TADOTable;
    dbScansGrid: TDBGrid;
    DataSource2: TDataSource;
    qQuery: TADOQuery;
    Panel2: TPanel;
    Memo2: TMemo;
    btnClear: TButton;
    ActionList1: TActionList;
    acSaveToFile: TAction;
    cbRayon: TsComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    btnAnRegions: TButton;
    acReginoAnaliz: TAction;
    panAll: TPanel;
    panRight: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    panRightTop: TPanel;
    sShellListView1: TsShellListView;
    ADOQuery2: TADOQuery;
    Label29: TLabel;
    Label30: TLabel;
    JvFormStorage1: TJvFormStorage;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    Memo3: TMemo;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    cbOtkaz: TCheckBox;
    btnOtkaz: TButton;
    acBtnEnambleOtkaz: TAction;
    tOtkazniki: TADOTable;
    qOtkazniki: TADOQuery;
    Memo4: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure sDirectoryEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure btnImportBDClick(Sender: TObject);
    procedure btnClearBDClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sShellTreeView1DblClick(Sender: TObject);
    procedure btnNewScanClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure acSaveToFileUpdate(Sender: TObject);
    procedure cbRayonChange(Sender: TObject);
    procedure btnAnRegionsClick(Sender: TObject);
    procedure acReginoAnalizUpdate(Sender: TObject);
    procedure acBtnEnambleOtkazUpdate(Sender: TObject);
    procedure btnOtkazClick(Sender: TObject);
  private
    ClientsCount: Integer;
    { Private declarations }
    function IsDirEmpty(sDirPath: String): Boolean;
    function FindFileInFolder(path, ext: string): Boolean;
    function CheckFileAssignToNodes(Node: TTreeNode): Boolean;
    function ChildAnalisitik(Node: TTreeNode): Boolean;
    function CountPoz(nameStringLIst: TStringLIst;
      mytable, pole, val: String): String;
    function ParsNumAnk(stroka: String): String;
    function PoleClient(table, nAnk: String; pole: String): String; // ������
    function Invalid(numAnk: String): String; // �� ������������
    function ScanDocs(numAnk: String): TStringLIst;
    // ����� ���� ���� �����������
    procedure RegionStatistic(nameRegion: String); // �������� �� ������
    procedure Statistic; // ����������
    procedure GetComboItems; // �������� ������ ��������
    procedure CleanOutTableAndIndex(tabl: String);
    // ������� ������� � ��������� �������
    procedure CleanOutTable(tabl: String); // �������� ������� �� �������
    function IsNumber(N: String): Boolean; // �������� ��� ����� ������
    function GetDirCount(Dir: string): Integer; // �-�� �������� � �����
    function GetDirStringlist(Dir: string): TStringLIst;
    // �-�� �������� � �����
    function IsEssetPole(table, nAnk, pole: String): Boolean;

  var
    PathFolder: String;

  public
    { Public declarations }

  var
    ZH_List, nonZH_List, Children_List, Inval_List, DirList: TStringLIst;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uMyExcel, jpeg2pdf;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ZH_List.Free;
  nonZH_List.Free;
  Children_List.Free;
  Inval_List.Free;
  DirList.Free;
  Memo2.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'info.txt');
  // Memo3.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'otkaz.txt');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'info.txt') then
    Memo2.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'info.txt');

  // if FileExists(ExtractFilePath(Application.ExeName) + 'otkaz.txt') then
  // Memo3.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
  // 'otkaz.txt');

  // ClientsCount := N-m;

  ADOConnection1.Connected := False;
  ADOConnection1.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
    ExtractFilePath(Application.ExeName) +
    'Scan.mdb;Persist Security Info=False';
  ADOConnection1.Connected := True;
  ADOTable1.Active := True;
  ADOTable2.Active := True;

  ZH_List := TStringLIst.Create;
  nonZH_List := TStringLIst.Create;
  Children_List := TStringLIst.Create;
  Inval_List := TStringLIst.Create;
  DirList := TStringLIst.Create;

  Statistic; // ������� ������ ��������������


  GetComboItems(); // ��������� ������ �������

  PathFolder := 'D:\';
  // sShellTreeView1.Root := PathFolder;
  // sShellTreeView1.Root := sDirectoryEdit1.Text;
  // sShellTreeView1.FullExpand; // ��������� ������
  // sShellTreeView1.Active := True;

  if ADOTable1.IsEmpty then
  begin
    btnImportBD.Enabled := True;
    dbClients.Visible := False;
  end
  else
  begin
    btnImportBD.Enabled := False;
    dbClients.Visible := True;
  end;

  if btnImportBD.Enabled then
    btnClearBD.Enabled := False;
  if (sShellTreeView1.Root = sDirectoryEdit1.Text) then
    btnNewScan.Enabled := True;

  if ADOTable2.IsEmpty then
  begin
    dbScansGrid.Visible := False;
  end
  else
  begin
    dbScansGrid.Visible := True;
  end;
end;

procedure TForm1.GetComboItems;
var
  i: Integer;
begin // ��������� ������ �������
  ADOTable2.Active := True;
  if ADOTable2.RecordCount > 0 then
  begin
    qQuery.Active := False;
    qQuery.SQL.Clear;
    qQuery.SQL.Add('SELECT Clients.rayon ');
    qQuery.SQL.Add('FROM Clients ');
    qQuery.SQL.Add('GROUP BY Clients.rayon; ');
    qQuery.Open;
    qQuery.Active;
    qQuery.First;
    cbRayon.Items.Clear;
    for i := 0 to qQuery.RecordCount - 1 do
    begin
      cbRayon.Items.Add(qQuery.FieldByName('rayon').AsString);
      qQuery.Next;
    end;
  end;
end;

function TForm1.GetDirCount(Dir: string): Integer;
var
  fs: TSearchRec;
begin
  Result := 0;
  Dir := IncludeTrailingPathDelimiter(Dir);
  if FindFirst(Dir + '*.*', faAnyFile, fs) = 0 then
    try
      repeat
        if (fs.Attr and faDirectory <> 0) and (fs.Name <> '.') and
          (fs.Name <> '..') then
        begin
          inc(Result);
        end;
      until FindNext(fs) <> 0;
    finally
      FindClose(fs);
    end;
end;

function TForm1.GetDirStringlist(Dir: string): TStringLIst;
var
  fs: TSearchRec;
begin // �������� ������ ���������� ������� ������
  Result := nil;
  DirList.Clear;
  Dir := IncludeTrailingPathDelimiter(Dir);
  if FindFirst(Dir + '*.*', faAnyFile, fs) = 0 then
    try
      repeat
        if (fs.Attr and faDirectory <> 0) and (fs.Name <> '.') and
          (fs.Name <> '..') then
        begin
          DirList.Add(fs.Name);
        end;
      until FindNext(fs) <> 0;
    finally
      FindClose(fs);
      DirList.Sort;
      Result := DirList;
    end;
end;

procedure TForm1.sDirectoryEdit1Change(Sender: TObject);
begin
  sShellTreeView1.Active := False;
  btnNewScan.Enabled := True;
  sShellTreeView1.Root := sDirectoryEdit1.Text;
  PathFolder := sDirectoryEdit1.Text;
  sShellTreeView1.Active := True;
end;

function TForm1.Invalid(numAnk: String): String;
begin
  with ADOQuery1 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Clients WHERE Num_ank=' + numAnk + ';');
    Active := True;
    Result := FieldByName('invalid').AsString;
    Active := False;
  end;
end;

function TForm1.IsDirEmpty(sDirPath: String): Boolean;
var // ����� ����� ������
  fs: TSearchRec;
begin

  Result := True;
  sDirPath := IncludeTrailingPathDelimiter(sDirPath);
  if FindFirst(sDirPath + '*.*', faAnyFile, fs) = 0 then
    repeat
      if (fs.Name <> '.') and (fs.Name <> '..') then
      begin
        Result := False;
        FindClose(fs);
        Exit;
      end;
    until FindNext(fs) <> 0;
  FindClose(fs);

end;

function TForm1.IsEssetPole(table, nAnk, pole: String): Boolean;
begin
  with ADOQuery1 do
  begin
    Result := False;
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + table + ' WHERE Num_ank=' + nAnk + ';');
    Active := True;
    if RecordCount <> 0 then
      Result := True;
    Active := False;
  end;

end;

function TForm1.IsNumber(N: String): Boolean;
var
  i: Integer;
begin
  Result := True;
  if Trim(N) = '' then
    Exit(False);

  if (Length(Trim(N)) > 1) and (Trim(N)[1] = '0') then
    Exit(False);

  for i := 1 to Length(N) do
  begin
    if not(N[i] in ['0' .. '9']) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function TForm1.FindFileInFolder(path, ext: string): Boolean;
Var // ����� ������� ����� � �����
  SR: TSearchRec; // ��������� ���������� ���� ���������
  Maska, maska2: String;
begin
  Result := True;
  Maska := path + ext;
  maska2 := path + AnsiUpperCase(ext);
  If ((FindFirst(Maska, faAnyFile, SR) = 0) or (FindFirst(maska2, faAnyFile,
    SR) = 0)) then // ��������� �����
  begin
    Repeat
      If (SR.Name = '.') Or (SR.Name = '..') Then
        // ���� ��� ����� ����� ��� ���� ������
        Continue; // �� ���������� ����� ������

      Result := False;

      // ListBox1.Items.Add(path + SR.Name);

      If ((SR.Attr And faDirectory) <> 0) Then
        FindFileInFolder(path + SR.Name + '\', ext);
      Application.ProcessMessages;
    Until FindNext(SR) <> 0;
    FindClose(SR);
  end;

end;

function TForm1.CheckFileAssignToNodes(Node: TTreeNode): Boolean;
var
  Child: TTreeNode;
  fName, fNode: String;
begin
  fNode := Node.Text + '\';

  if Node.Level = 1 then
  begin
    Child := Node.getFirstChild;
    while Assigned(Child) do
    begin
      fName := Child.Text;
      if FindFileInFolder(PathFolder + '\' + fNode + fName + '\', '*.pdf') then
      begin
        Result := False; // ��� ������
      end
      else
      begin
        Result := True; // ���� �����
      end;
      Child := Node.GetNextChild(Child);
    end;
  end;
end;

procedure TForm1.sShellTreeView1DblClick(Sender: TObject);
begin
  sDirectoryEdit1.Text := sShellTreeView1.SelectedFolder.PathName;
  // sDirectoryEdit1Change(self);
end;

procedure TForm1.Statistic;
begin
  Label9.Caption := ADOTable1.RecordCount.ToString;
  Label14.Caption := CountPoz(ZH_List, 'Clients', 'status', '�'); // �
  Label15.Caption := CountPoz(nonZH_List, 'Clients', 'status', '�/�'); // ��
  Label16.Caption := CountPoz(Inval_List, 'Clients', 'invalid', '��'); // ���
  Label17.Caption := CountPoz(Children_List, 'Clients', 'status', 'CI'); // ����

  // ���-�� ��������

  ADOTable2.Close;
  ADOTable2.Open;
  Label1.Caption := IntToStr(ADOTable2.RecordCount); // ����� �����
  with ADOQuery1 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Scans WHERE (Scans.FIO<>"");');
    Active := True;
    Label6.Caption := IntToStr(RecordCount); // ��������
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Scans WHERE ((Scans.����������=False) AND (Scans.������������=False) AND');
    SQL.Add('(Scans.��������=False) AND (Scans.������������=False) AND (Scans.���=False) AND');
    SQL.Add('(Scans.��������������=False) AND (Scans.[������ SOS]=False) AND (Scans.[������ ���������]=False) AND');
    SQL.Add('(Scans.�������=False) AND (Scans.[���������� �������������]=False) AND (Scans.[����������� ������]=False) AND');
    SQL.Add('(Scans.[������������� � ��������]=False) AND (Scans.[���������� �� �������� �����]=False) AND');
    SQL.Add('(Scans.[������� � �������]=False) AND (Scans.[����� ������ ��]=False) AND (Scans.[����� ��������]=False));');
    Active := True;
    Label19.Caption := IntToStr(ADOTable2.RecordCount - RecordCount);
    // ������������ �����
    Active := False;
  end;
end;

function TForm1.PoleClient(table, nAnk: String; pole: String): String;
begin // ������
  with ADOQuery1 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + table + ' WHERE Num_ank=' + nAnk + ';');
    Active := True;
    Result := FieldByName(pole).AsString;
    // Result := FieldByName('status').AsString;
    Active := False;
  end;
end;

procedure TForm1.RegionStatistic(nameRegion: String);
var
  i: Integer;
begin
  Label5.Caption := nameRegion;
  Memo1.Lines.Add('--------------- ' + nameRegion +
    ' ----------------------- ');

  with ADOQuery1 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Clients ');
    SQL.Add('WHERE (((Clients.rayon)="' + nameRegion + '"));');
    Active := True;
    Label21.Caption := IntToStr(RecordCount); // ������ �볺��� � ��� ̲�
    Memo1.Lines.Add('������ �볺��� � ��� ̲�: - ' + Label21.Caption);
  end;

  with ADOQuery2 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Scans ');
    SQL.Add('WHERE (((Scans.Rayon)="' + nameRegion + '"));');
    Active := True;
    Label26.Caption := IntToStr(RecordCount); // ������ ����� �볺��� ��� �����

    if Label21.Caption <> Label26.Caption then
      Memo1.Lines.Add('������ ����� �볺��� ��� �����: - ' + Label26.Caption);
  end;

  // ���� ������ ������ ����� ������ �����, ������ ��� ����� ��� �������
  if (ADOQuery1.RecordCount <> ADOQuery2.RecordCount) then
  begin
    with qQuery do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT Clients.Num_ank, Clients.rayon, Scans.Num_ank ');
      SQL.Add('FROM Clients LEFT JOIN Scans ON Clients.Num_ank = Scans.Num_ank ');
      SQL.Add('WHERE (((Clients.rayon)="' + nameRegion +
        '") AND ((Scans.Num_ank) Is Null));');
      Active := True;
      Memo1.Lines.Add('³����� ����� ��� �����: ');
      for i := 0 to RecordCount - 1 do
      begin
        Memo1.Lines.Add(FieldByName('Clients.Num_ank').AsString);
        Next;
      end;
      Active := False;
    end;
    Memo1.Lines.Add('-------------------------------------- ');
    ADOQuery1.Active := False;
    qQuery.Active := False;

  end
  else
  begin
    ADOQuery1.Active := False;
    qQuery.Active := False;
  end;

  with ADOQuery1 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Scans ');
    SQL.Add('WHERE (((Scans.IsOK)=True) AND ((Scans.Rayon)="' + nameRegion
      + '"));');
    Active := True;
    Label23.Caption := IntToStr(RecordCount); // ������������ ����� �������
    Active := False;
  end;

  Label25.Caption := IntToStr(StrToInt(Label26.Caption) -
    StrToInt(Label23.Caption)); // �� ������� �����������
  Memo1.Lines.Add('�� ������� �����������: - ' + Label25.Caption);

  with ADOQuery1 do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Scans ');
    SQL.Add('WHERE (((Scans.IsOK)=False) AND ((Scans.Rayon)="' +
      nameRegion + '")');
    SQL.Add(' AND ((Scans.����������)=False) AND ((Scans.������������)=False) AND ((Scans.��������)=False) AND ((Scans.������������)=False) AND ');
    SQL.Add(' ((Scans.���)=False) AND ((Scans.��������������)=False) AND ((Scans.[������ SOS])=False) AND ((Scans.[������ ���������])=False) AND ');
    SQL.Add(' ((Scans.�������)=False) AND ((Scans.[���������� �������������])=False) AND ((Scans.[����������� ������])=False) AND ((Scans.[������������� � ��������])=False) ');
    SQL.Add(' AND ((Scans.[���������� �� �������� �����])=False) AND ((Scans.[������� � �������])=False) AND');
    SQL.Add(' ((Scans.[����� ������ ��])=False) AND ((Scans.[����� ��������])=False)); ');
    Active := True;

    if RecordCount <> 0 then
    begin

      Label28.Caption := IntToStr(RecordCount); // �� �������� ������
      Memo1.Lines.Add('�� �������� ������: - ' + Label28.Caption);

      Memo1.Lines.Add('������ �� �������� ������: ');
      for i := 0 to RecordCount - 1 do
      begin
        Memo1.Lines.Add(chr(VK_TAB) + FieldByName('Num_ank').AsString + ' - ' +
          FieldByName('FIO').AsString);
        Next;
      end;
      Active := False;
    end;
    // Memo1.Lines.Add('-------------------------------------- ');
  end;
  // Active := False;
  // Memo1.Lines.Add(' ================================================= ');

end;

function TForm1.ParsNumAnk(stroka: String): String;
begin // ������� ������ �� ����� ������
  Result := copy(stroka, 1, pos(' ', stroka) - 1);
end;

function TForm1.ChildAnalisitik(Node: TTreeNode): Boolean;
var
  Node01, Child: TTreeNode;
begin
  Node.Selected;
  // Node01 := TTreeNode.Create(Self);
  Node01.Assign(Node);
  Node01.Expanded := True;
  Child := Node01.getFirstChild;
  while Assigned(Child) do
  begin
    Memo1.Lines.Add(Child.Text);
    Child := Node01.GetNextChild(Child);
  end;
  Node01.Expanded := False;
  // Node01.Free;
end;

procedure TForm1.CleanOutTable(tabl: String);
begin
  with qQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Delete * From ' + tabl);
    ExecSQL;
    Close;
  end;
end;

procedure TForm1.CleanOutTableAndIndex(tabl: String);
begin
  with qQuery do
  begin
    // �������� ������ �������
    Close;
    SQL.Clear;
    SQL.Add('Alter Table ' + tabl + '  Alter Column ��� Counter(1,1)');
    ExecSQL;
    Close;
    CleanOutTable(tabl); // ������� �������
  end;
end;

function TForm1.CountPoz(nameStringLIst: TStringLIst;
  mytable, pole, val: String): String;
var
  i: Integer;
begin
  with ADOQuery1 do
  begin
    Active := False;
    // open;
    SQL.Clear;

    if val <> '' then
    begin
      if (pole = 'Num_ank') then
        SQL.Add('SELECT * FROM ' + mytable + ' WHERE ' + pole + '=' + val + ';')
      else
        SQL.Add('SELECT * FROM ' + mytable + ' WHERE ' + pole + '="' +
          val + '";');
      Active := True;

      if not(nameStringLIst = nil) then
      begin
        nameStringLIst.Clear;
        if Assigned(nameStringLIst) then
        begin
          // nameStringLIst := TStringLIst.Create;
          First;
          for i := 0 to RecordCount - 1 do
          begin
            nameStringLIst.Add((FieldByName('Num_ank').AsInteger).ToString);
            Next;
          end;
        end;
      end;
      Result := ADOQuery1.RecordCount.ToString;

    end;
    // Close;
    Active := False;
  end;
end;

// ****************************************************************************

procedure TForm1.btnSaveToFileClick(Sender: TObject);
begin
  if SaveTextFileDialog1.Execute then
    Memo1.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.btnImportBDClick(Sender: TObject);
var
  ExcFileNAme: String; // ���� � ���� ����� EXCEL
  m, N: Integer; //
begin
  dbClients.DataSource := nil;
  ADOTable1.Open;
  OpenDialog1.Filter :=
    '����� MS Excel|-=����1=-�������&����.xls;-=����1=-�������&����.xlsx|';
    OpenDialog1.FileName := '-=����1=-�������&����.xlsx';

  if uMyExcel.RunExcel(False, False) = True then
    // �������� �� ������� � ������ Excel
    if OpenDialog1.Execute then
      ExcFileNAme := OpenDialog1.FileName
    else
      ShowMessage('Open file was cancelled');

  if uMyExcel.OpenWorkBook(ExcFileNAme, False) then // ��������� ����� Excel
  begin
    btnImportBD.Enabled := False;
    m := 2; // �������� ���������� �� 2-� ������, �������� ��������� �������
    N := MyExcel.ActiveCell.SpecialCells($000000B).Row + 1;
    ClientsCount := N - m; // ������� �������� c ������

    prgsBar.Min := 0;
    prgsBar.Max := N;

    // ��������� ����������� ������
    while m <> N do // ���� ������� �� ������� EXCEL
    begin
      with ADOTable1 do
      begin
        Insert;
        FieldByName('Num_ank').AsInteger := MyExcel.Cells[m, 1].value;
        FieldByName('obl').AsString := MyExcel.Cells[m, 2].value;
        FieldByName('rayon').AsString := MyExcel.Cells[m, 3].value;
        FieldByName('city').AsString := MyExcel.Cells[m, 4].value;
        FieldByName('status').AsString := MyExcel.Cells[m, 5].value;
        FieldByName('FIO').AsString := MyExcel.Cells[m, 6].value;
        FieldByName('invalid').AsString := MyExcel.Cells[m, 7].value;
        FieldByName('age').AsInteger := MyExcel.Cells[m, 8].value;
        Post;
      end;
      inc(m);
      prgsBar.Position := m;
    end;
    // ADOTable1.First;
    // btnClearBD.Enabled := True;
  end;
  prgsBar.Position := 0;
  // ***************************************************************************

  OpenDialog1.Filter :=
    '����� MS Excel|-=����2=-��������.xls;-=����2=-��������.xlsx|';
      OpenDialog1.FileName := '-=����2=-��������.xlsx';
  if OpenDialog1.Execute then
    ExcFileNAme := OpenDialog1.FileName
  else
    ShowMessage('Open file was cancelled');

  if uMyExcel.OpenWorkBook(ExcFileNAme, False) then // ��������� ����� Excel
  begin
    btnImportBD.Enabled := False;
    m := 2; // �������� ���������� �� 2-� ������, �������� ��������� �������
    N := MyExcel.ActiveCell.SpecialCells($000000B).Row + 1;

    prgsBar.Min := 0;
    prgsBar.Max := N;

    // ��������� ����������� ������

    while m <> N do // ���� ������� �� ������� EXCEL
    begin
      with ADOTable1 do
      begin
        Insert;
        FieldByName('Num_ank').AsInteger := MyExcel.Cells[m, 5].value;
        FieldByName('obl').AsString := MyExcel.Cells[m, 1].value;
        FieldByName('rayon').AsString := MyExcel.Cells[m, 2].value;
        FieldByName('city').AsString := MyExcel.Cells[m, 3].value;
        FieldByName('status').AsString := 'R'; //��������
        //MyExcel.Cells[m, 4].value;
        FieldByName('FIO').AsString := MyExcel.Cells[m, 6].value;
        FieldByName('invalid').AsString := MyExcel.Cells[m, 7].value;
        FieldByName('age').AsInteger := MyExcel.Cells[m, 8].value;
        Post;
      end;
      inc(m);
      prgsBar.Position := m;
    end;

    ADOTable1.First;
    btnClearBD.Enabled := True;

  end;

  uMyExcel.StopExcel;
  prgsBar.Position := 0;
  Statistic; // ������� ������ ��������������
  dbClients.DataSource := DataSource1;
  if not ADOTable1.IsEmpty then
    dbClients.Visible := True;
Label30.Caption := (ClientsCount - StrToInt(Label17.Caption)).ToString;
end;

procedure TForm1.btnClearBDClick(Sender: TObject);
begin
  dbClients.Visible := False;
  dbScansGrid.Visible := False;
  btnImportBD.Enabled := True;
  btnClearBD.Enabled := False;
  ADOTable1.Close;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Delete * From Clients');
    ExecSQL;
    Close;
  end;
  ADOTable1.Open;

  ADOTable2.Open;
  if not ADOTable2.IsEmpty then
    CleanOutTableAndIndex('Scans');
  // ADOTable2.Refresh;
  cbRayon.Items.Clear;
  // GetComboItems(); //��������� ������ �������
  Label9.Caption := '0';
  Label14.Caption := '0';
  Label15.Caption := '0';
  Label16.Caption := '0';
  Label17.Caption := '0';
  Label1.Caption := '0';
  Label19.Caption := '0';
  Label6.Caption := '0';
  Label30.Caption := '0';
end;

procedure TForm1.cbRayonChange(Sender: TObject);
var
  nameRegion: String;
begin
  Label5.Caption := '...';
  Label21.Caption := '...';
  Label23.Caption := '...';
  Label25.Caption := '...';
  Label26.Caption := '...';
  // Label30.Caption := '...';

  nameRegion := cbRayon.Items[cbRayon.ItemIndex];
  RegionStatistic(nameRegion);
end;

function TForm1.ScanDocs(numAnk: String): TStringLIst;
var // ����� ���� ���� �����������
  Documents: TStringLIst;
  st: String;
begin
  Documents := TStringLIst.Create;
  Documents.Add('��������������');
  Documents.Add('����������� ������');
  Documents.Add('����� ��������');
  st := PoleClient('Clients', numAnk, 'status');
  case AnsiIndexStr(st, ['CI', '�/�', '�', 'R']) of
    0:     // ����
      begin
        Documents.Add('������������� � ��������');
      end;
    1:       // �� ������
      begin
        Documents.Add('��������');
        Documents.Add('���');
        Documents.Add('�������');
        Documents.Add('���������� �������������');
        Documents.Add('������� � �������');
      end;
    2:    // ������
      begin
        Documents.Add('��������');
        Documents.Add('���');
        Documents.Add('�������');
        Documents.Add('���������� �������������');
        Documents.Add('������� � �������');
        Documents.Add('����������');
        Documents.Add('����� ������ ��');
      end;
      3:   // ��������
      begin
        Documents.Add('���');
        Documents.Add('�������');
        Documents.Add('������� � �������');
      end;

  end;
  // ��������� �� ������������
  if Invalid(numAnk) = '��' then
    Documents.Add('������������');
  Result := Documents; // �� ������ ������ ����������
  // Documents.Free;
end;

procedure TForm1.acBtnEnambleOtkazUpdate(Sender: TObject);
begin
  if Memo3.Lines.Count > 0 then
    btnOtkaz.Enabled := True
  else
    btnOtkaz.Enabled := False;
end;

procedure TForm1.acReginoAnalizUpdate(Sender: TObject);
begin
  if cbRayon.Items.Count = 0 then
    btnAnRegions.Enabled := False
  else
    btnAnRegions.Enabled := True;

end;

procedure TForm1.acSaveToFileUpdate(Sender: TObject);
begin
  if Memo1.Lines.Count = 0 then
  begin
    btnSaveToFile.Enabled := False;
    btnClear.Enabled := False;
  end
  else
  begin
    btnSaveToFile.Enabled := True;
    btnClear.Enabled := True;
  end;

end;

procedure TForm1.btnNewScanClick(Sender: TObject);
var
  Scan_OK, Scan_Nado, Scan_Real, Attr, IndexEmptyFolder, DirCount, i, C_ount: Integer;
  Node, NewNode: TTreeNode;
  fNode, nameChildNode, noneDocum, DirPath, nameNode: String;
  SpisokDocuments: TStringLIst;
  tr: TsShellTreeView;
  searchResult: TSearchRec;
  fName: String;
begin
  // ����� �������� �����
  dbScansGrid.DataSource := nil;
  dbScansGrid.Visible := False;
  ADOTable2.Open;

  CleanOutTableAndIndex('Scans'); // �������
  Scan_Nado := 0;
  Scan_Real := 0;
  Scan_OK := 0;
  C_ount := 0;

  DirPath := sDirectoryEdit1.Text;
  DirCount := GetDirCount(DirPath); // ���-�� �����
  GetDirStringlist(DirPath); // ������� ������ ����� �� ����������

  // +++++++++++++++++++++ 2-� ���� ++++++++++++++++++++++++++++++++++++++++++++++
  prgsBar.Min := 0;
  prgsBar.Max := DirList.Count - 1;
  prgsBar.Position := 0;

  // ����������� �� ������ ������� ������ ����� ������
  for i := 0 to DirList.Count - 1 do
  begin
    nameNode := DirList.Strings[i];

    if not(nameNode = '������') then
    begin
      // *************** ���� ������ ���� � ������� Clients �� ������, �� � �����  ******************
      if PoleClient('Clients', nameNode, 'Num_ank') <> '' then
      begin
        // =================================== ���������? =========================

        if cbOtkaz.Checked = True then
        begin // ��������� ����������
          // ��������� ��� ���� ����� ������ � ����������
          qOtkazniki.Close;
          qOtkazniki.SQL.Clear;
          qOtkazniki.SQL.Add('select * from Otkazniki where Otkazniki.Num_ankety = "'+ nameNode + '"');
          qOtkazniki.Open;

          if qOtkazniki.RecordCount = 0 then // �� ��������
          begin
            Inc(C_ount);
            ADOTable2.Insert;

            // ������ ���������� ������� ������ ���� ��� ������ ������
            SpisokDocuments := ScanDocs(nameNode);

            // ������� ������� ���� ���������� ��� ����� ��� ���� ��������
            Scan_Nado := Scan_Nado + SpisokDocuments.Count;

            // ��������� � ������ ������ ����
            tr := TsShellTreeView.Create(Owner);
            tr.Parent := Panel2;
            tr.Visible := False;

            tr.Root := sDirectoryEdit1.Text + '\' + nameNode;

            NewNode := tr.Items[0]; // ������ �� ������� ����
            Node := NewNode.getFirstChild; // ������ �� �������� ����

            ADOTable2.FieldByName('Num_Ank').AsString := nameNode;
            ADOTable2.FieldByName('FIO').AsString :=
              PoleClient('Clients', nameNode, 'FIO');
            ADOTable2.FieldByName('Status').AsString :=
              PoleClient('Clients', nameNode, 'Status');
            ADOTable2.FieldByName('Obl').AsString :=
              PoleClient('Clients', nameNode, 'obl');
            ADOTable2.FieldByName('Rayon').AsString :=
              PoleClient('Clients', nameNode, 'rayon');
            ADOTable2.FieldByName('City').AsString :=
              PoleClient('Clients', nameNode, 'city');
            // ��������� ������� ������������ ����� - (1-��� ������)
            IndexEmptyFolder := 1;
            noneDocum := ''; // �������� �������� ���-��� ������� �� �������

            // ����������� �� ������ ������ ������
            while Assigned(Node) do
            begin
              nameChildNode := Node.Text; // ��� �������� ����

              fName := tr.Root + nameChildNode + '\Thumbs.db';
              if not FindFileInFolder(tr.Root + nameChildNode + '\Thumbs',
                '*.db') then
              begin
                DeleteFile(fName);
                Memo4.Lines.Add('���� - Thumbs.db ��������� � ' + nameNode + '/'
                  + nameChildNode);
              end;
              // --------- ���� �������������� jpf to pdf ------------------
              if not FindFileInFolder(tr.Root + nameChildNode + '\', '*.jpg')
              then
              begin
                Memo4.Lines.Add('� ����� ' + nameNode + ' JPG-�: ' +
                  nameChildNode);
                // ��� �����, �������� ���� � �����.
                Attr := faAnyFile - faVolumeID - faDirectory;
                try
                  if FindFirst(tr.Root + nameChildNode + '\' + '*.jpg', Attr,
                    searchResult) = 0 then
                    repeat
                      Memo4.Lines.Add('���� - ' + searchResult.Name +
                        ' ������������� � PDF');
                      fNode := tr.Root + nameChildNode + '\' +
                        ChangeFileExt(searchResult.Name, '');
                      if (JPGtoPDF(fNode + '.jpg', fNode + '.pdf') = True) then
                        DeleteFile(fNode + '.jpg');
                    until FindNext(searchResult) <> 0;
                finally
                  FindClose(searchResult);

                end;
                Memo4.Lines.Add(' ------------- ');
              end;
              // =============================================================


              // ��������� �� ������ ����� �� ������ ����������

              if FindFileInFolder(tr.Root + nameChildNode + '\', '*.pdf') then
              begin // ������ �����
                ADOTable2.FieldByName(nameChildNode).AsBoolean := False;

                // ������������ ����� ��� ��� ��� ������� ����� ��� ������� �������

                if SpisokDocuments.IndexOf(nameChildNode) >= 0 then
                begin // ��
                  if IndexEmptyFolder = 1 then
                    IndexEmptyFolder := 0;
                  noneDocum := noneDocum + nameChildNode + ', ';
                  // �������� ���� � ���� ������
                end;

              end
              else
              begin // � ����� ���� �����
                ADOTable2.FieldByName(nameChildNode).AsBoolean := True;
                inc(Scan_Real);
              end;

              Node := NewNode.GetNextChild(Node);
            end;

            if IndexEmptyFolder = 0 then
            begin
              Memo1.Lines.Add(C_ount.ToString +'.' + chr(VK_TAB) +
                PoleClient('Clients', nameNode, 'rayon') +
                chr(VK_TAB) + PoleClient('Clients', nameNode, 'city') +
                chr(VK_TAB) + nameNode + chr(VK_TAB) + PoleClient('Clients',
                nameNode, 'status') + chr(VK_TAB) + PoleClient('Clients',
                nameNode, 'FIO') + chr(VK_TAB) + '��� ������: ' + noneDocum);
              // Memo1.Lines.Add(' --------------------------------------------- ');
              ADOTable2.FieldByName('IsOK').AsBoolean := False;
            end
            else
            begin // � ���� �������� ��� ��������� �������
              ADOTable2.FieldByName('IsOK').AsBoolean := True;
              inc(Scan_OK);
              Dec(C_ount);
            end;

            ADOTable2.Post;
            prgsBar.Position := i;
            tr.Free;

          end;
        end
        else
        begin // �� ��������� ����������
          Inc(C_ount);
          ADOTable2.Insert;

          // ������ ���������� ������� ������ ���� ��� ������ ������
          SpisokDocuments := ScanDocs(nameNode);

          // ������� ������� ���� ���������� ��� ����� ��� ���� ��������
          Scan_Nado := Scan_Nado + SpisokDocuments.Count;

          // ��������� � ������ ������ ����
          tr := TsShellTreeView.Create(Owner);
          tr.Parent := Panel2;
          tr.Visible := False;

          tr.Root := sDirectoryEdit1.Text + '\' + nameNode;

          NewNode := tr.Items[0]; // ������ �� ������� ����
          Node := NewNode.getFirstChild; // ������ �� �������� ����

          ADOTable2.FieldByName('Num_Ank').AsString := nameNode;
          ADOTable2.FieldByName('FIO').AsString :=
            PoleClient('Clients', nameNode, 'FIO');
          ADOTable2.FieldByName('Status').AsString :=
            PoleClient('Clients', nameNode, 'Status');
          ADOTable2.FieldByName('Obl').AsString :=
            PoleClient('Clients', nameNode, 'obl');
          ADOTable2.FieldByName('Rayon').AsString :=
            PoleClient('Clients', nameNode, 'rayon');
          ADOTable2.FieldByName('City').AsString :=
            PoleClient('Clients', nameNode, 'city');
          // ��������� ������� ������������ ����� - (1-��� ������)
          IndexEmptyFolder := 1;
          noneDocum := ''; // �������� �������� ���-��� ������� �� �������

          // ����������� �� ������ ������ ������
          while Assigned(Node) do
          begin
            nameChildNode := Node.Text; // ��� �������� ����

            fName := tr.Root + nameChildNode + '\Thumbs.db';
            if not FindFileInFolder(tr.Root + nameChildNode + '\Thumbs', '*.db')
            then
            begin
              DeleteFile(fName);
              Memo4.Lines.Add('���� - Thumbs.db ��������� � ' + nameNode + '/' +
                nameChildNode);
            end;
            // --------- ���� �������������� jpf to pdf ------------------
            if not FindFileInFolder(tr.Root + nameChildNode + '\', '*.jpg') then
            begin
              Memo4.Lines.Add('� ����� ' + nameNode + ' JPG-�: ' +
                nameChildNode);
              // ��� �����, �������� ���� � �����.
              Attr := faAnyFile - faVolumeID - faDirectory;
              try
                if FindFirst(tr.Root + nameChildNode + '\' + '*.jpg', Attr,
                  searchResult) = 0 then
                  repeat
                    Memo4.Lines.Add('���� - ' + searchResult.Name +
                      ' ������������� � PDF');
                    fNode := tr.Root + nameChildNode + '\' +
                      ChangeFileExt(searchResult.Name, '');
                    if (JPGtoPDF(fNode + '.jpg', fNode + '.pdf') = True) then
                      DeleteFile(fNode + '.jpg');
                  until FindNext(searchResult) <> 0;
              finally
                FindClose(searchResult);

              end;
              Memo4.Lines.Add(' ------------- ');
            end;
            // =============================================================


            // ��������� �� ������ ����� �� ������ ����������

            if FindFileInFolder(tr.Root + nameChildNode + '\', '*.pdf') then
            begin // ������ �����
              ADOTable2.FieldByName(nameChildNode).AsBoolean := False;

              // ������������ ����� ��� ��� ��� ������� ����� ��� ������� �������

              if SpisokDocuments.IndexOf(nameChildNode) >= 0 then
              begin // ��
                if IndexEmptyFolder = 1 then
                  IndexEmptyFolder := 0;
                noneDocum := noneDocum + nameChildNode + ', ';
                // �������� ���� � ���� ������
              end;

            end
            else
            begin // � ����� ���� �����
              ADOTable2.FieldByName(nameChildNode).AsBoolean := True;
              inc(Scan_Real);
            end;

            Node := NewNode.GetNextChild(Node);
          end;

          if IndexEmptyFolder = 0 then
          begin
            Memo1.Lines.Add(C_ount.ToString +'.' + chr(VK_TAB) +
              PoleClient('Clients', nameNode, 'rayon') +
              chr(VK_TAB) + PoleClient('Clients', nameNode, 'city') +
              chr(VK_TAB) + nameNode + chr(VK_TAB) + PoleClient('Clients',
              nameNode, 'status') + chr(VK_TAB) + PoleClient('Clients',
              nameNode, 'FIO') + chr(VK_TAB) + '��� ������: ' + noneDocum);
            // Memo1.Lines.Add(' --------------------------------------------- ');
            ADOTable2.FieldByName('IsOK').AsBoolean := False;
          end
          else
          begin // � ���� �������� ��� ��������� �������
            ADOTable2.FieldByName('IsOK').AsBoolean := True;
            inc(Scan_OK);
            Dec(C_ount);
          end;

          ADOTable2.Post;
          prgsBar.Position := i;
          tr.Free;
        end;

      end;

    end;

  end;
  dbScansGrid.DataSource := DataSource2;
  dbScansGrid.Visible := True;
  prgsBar.Position := 0;

  // ���������� ������
  Statistic();
  GetComboItems(); // ��������� ������ �������
  Memo2.Lines.Add('------------' + DateToStr(Date) + '-----------');
  Memo2.Lines.Add('��������� ��-��� ����� = ' + Scan_Nado.ToString);
  Memo2.Lines.Add('³���������� ��-��� = ' + Scan_Real.ToString);
  Memo2.Lines.Add('������ �������� = ' + Scan_OK.ToString);
end;

procedure TForm1.btnOtkazClick(Sender: TObject);
var
  i: Integer;
begin
  tOtkazniki.Active := True;
  for i := 0 to Memo3.Lines.Count - 1 do
  begin
    tOtkazniki.Insert;
    tOtkazniki.FieldByName('Num_ankety').AsString := Memo3.Lines[i];
    tOtkazniki.Post;
  end;
  Memo3.Clear;
end;

procedure TForm1.btnAnRegionsClick(Sender: TObject);
var
  i: Integer;
begin // ����� ������
  for i := 0 to cbRayon.Items.Count - 1 do
  begin
    RegionStatistic(cbRayon.Items[i]);
  end;

end;

end.
