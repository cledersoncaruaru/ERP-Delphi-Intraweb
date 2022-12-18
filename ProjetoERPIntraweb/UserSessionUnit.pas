unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TIWUserSession = class(TIWUserSessionBase)
    Conexao: TFDConnection;
    procedure IWUserSessionBaseCreate(Sender: TObject);
  private
    FID_Cadastro: LongInt;
    FToken: String;
    procedure SetID_Cadastro(const Value: LongInt);
    procedure SetToken(const Value: String);
    { Private declarations }
  public
    { Public declarations }


    Property ID_Cadastro    : LongInt read FID_Cadastro write SetID_Cadastro;
    Property Token          : String read FToken write SetToken;


  end;

implementation

{$R *.dfm}

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
begin


 Conexao.Connected  := True;



end;

procedure TIWUserSession.SetID_Cadastro(const Value: LongInt);
begin
  FID_Cadastro := Value;
end;

procedure TIWUserSession.SetToken(const Value: String);
begin
  FToken := Value;
end;

end.