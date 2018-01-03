unit vMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  API_MVC_FMX, FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts,
  eAccount;

type
  TViewMain = class(TViewFMXBase)
    btn1: TButton;
    lst1: TListBox;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitView; override;
  public
    { Public declarations }
    procedure RenderAccountList(aAccountList: TAccountList);
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.fmx}

uses
  cController;

procedure TViewMain.RenderAccountList(aAccountList: TAccountList);
var
  Account: TAccount;
  ListBoxItem: TMetropolisUIListBoxItem;
begin
  for Account in aAccountList do
    begin
      ListBoxItem := TMetropolisUIListBoxItem.Create(lst1);

      ListBoxItem.Height := 50;
      ListBoxItem.SubTitle := '';
      ListBoxItem.Title := Account.Caption;
      ListBoxItem.Description := FloatToStr(Account.Rest);

      lst1.AddObject(ListBoxItem);
    end;
end;

procedure TViewMain.btn1Click(Sender: TObject);
begin
  inherited;
  SendMessage('AddAccount');
end;

procedure TViewMain.FormCreate(Sender: TObject);
begin
  inherited;
  SendMessage('PullAccountList');
end;

procedure TViewMain.InitView;
begin
  FControllerClass := TController;
  ViewMain := Self;
end;

end.
