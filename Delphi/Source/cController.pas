unit cController;

interface

uses
  API_MVC_FMX,
  eAccount;

type
  TController = class(TControllerFMXBase)
  private
    function GetAccountList: TAccountList;
    procedure Init; override;
    procedure SetAccountList(aValue: TAccountList);
  public
    constructor Create; override;
    property AccountList: TAccountList read GetAccountList write SetAccountList;
  published
    procedure AddAccount;
    procedure PullAccountList;
    procedure ViewMainClosed;
  end;

implementation

uses
  API_DB_SQLite,
  eCommon,
  System.SysUtils,
  System.UITypes,
  vAccount,
  vMain;


procedure TController.SetAccountList(aValue: TAccountList);
begin
  FDataObj.AddOrSetValue('AccountList', aValue);
end;

function TController.GetAccountList: TAccountList;
begin
  Result := FDataObj['AccountList'] as TAccountList;
end;

procedure TController.ViewMainClosed;
begin
  AccountList.Free;
end;

procedure TController.PullAccountList;
begin
  AccountList := TAccountList.Create([], ['ID']);
  ViewMain.RenderAccountList(AccountList);
end;

procedure TController.AddAccount;
var
  Account: TAccount;
begin
  Account := TAccount.Create(1);

  CreateView(TViewAccount);

  if ViewAccount.ShowModal = mrOk then
    begin

    end
  else
    Account.Free;
end;

constructor TController.Create;
begin
  inherited;

  // for use in global project context
  eCommon.DBEngine := Self.DBEngine;
end;

procedure TController.Init;
begin
  FConnectOnCreate := True;
  FConnectParams.DataBase := GetCurrentDir + '\DB\MRDBLocal.db';
  FDBEngineClass := TSQLiteEngine;
end;

end.
