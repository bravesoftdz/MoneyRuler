unit cController;

interface

uses
  API_MVC_DB;

type
  TController = class(TControllerDB)
  private
    procedure Init; override;
  public
    constructor Create; override;
  published
    procedure AddAccount;
    procedure PullAccountList;
  end;

implementation

uses
  API_DB_SQLite,
  eAccount,
  eCommon,
  System.SysUtils,
  vMain;

procedure TController.PullAccountList;
var
  AccountList: TAccountList;
begin
  AccountList := TAccountList.Create([], ['ID']);
  ViewMain.RenderAccountList(AccountList);

  AccountList.Free;
end;

procedure TController.AddAccount;
var
  Account: TAccount;
begin
  Account := TAccount.Create(1);
  Account.Caption := 'Мой новый счёт 3';
  Account.Rest := 89.5;

  Account.Store;
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
