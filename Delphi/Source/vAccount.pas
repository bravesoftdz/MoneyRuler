unit vAccount;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  API_MVC_FMX, FMX.Controls.Presentation, FMX.Edit;

type
  TViewAccount = class(TViewFMXBase)
    bcCaption: TEdit;
    lblCaption: TLabel;
  private
    { Private declarations }
    procedure InitView; override;
  public
    { Public declarations }
  end;

var
  ViewAccount: TViewAccount;

implementation

{$R *.fmx}

procedure TViewAccount.InitView;
begin
  ViewAccount := Self;
end;

end.
