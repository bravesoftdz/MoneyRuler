unit eAccount;

interface

uses
  API_ORM,
  eCommon;

type
  TAccount = class(TCommonEntity)
  private
    FCaption: string;
    FRest: Currency;
  public
    class function GetStructure: TSructure; override;
  published
    property Caption: string read FCaption write FCaption;
    property Rest: Currency read FRest write FRest;
  end;

  TAccountList = TCommonEntityList<TAccount>;

implementation

class function TAccount.GetStructure: TSructure;
begin
  Result.TableName := 'ACCOUNTS';
end;

end.
