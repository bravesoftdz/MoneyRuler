program MoneyRuler;

uses
  System.StartUpCopy,
  FMX.Forms,
  API_MVC_FMX in '..\..\..\Libs\Delphi\API_MVC_FMX.pas' {ViewFMXBase},
  API_MVC in '..\..\..\Libs\Delphi\API_MVC.pas',
  cController in 'cController.pas',
  vMain in 'vMain.pas' {ViewMain},
  API_MVC_DB in '..\..\..\Libs\Delphi\API_MVC_DB.pas',
  API_Crypt in '..\..\..\Libs\Delphi\API_Crypt.pas',
  API_DB in '..\..\..\Libs\Delphi\API_DB.pas',
  API_DB_SQLite in '..\..\..\Libs\Delphi\API_DB_SQLite.pas',
  eCommon in 'eCommon.pas',
  eAccount in 'eAccount.pas',
  API_ORM in '..\..\..\Libs\Delphi\API_ORM.pas',
  vAccount in 'vAccount.pas' {ViewAccount};

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF DEBUG}

  Application.Initialize;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
