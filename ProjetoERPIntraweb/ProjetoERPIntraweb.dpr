program ProjetoERPIntraweb;

uses
  FastMM4,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  IWStartHSys,
  uBase in '..\Source\base\uBase.pas' {FrmBase: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  uFrmLogin in '..\Source\uFrmLogin.pas' {FrmLogin: TIWAppForm},
  uFrmDashBoard in '..\Source\uFrmDashBoard.pas' {FrmDashBoard: TIWAppForm},
  uListaPessoa in '..\Source\Clientes\uListaPessoa.pas' {FrmListaPessoa: TIWAppForm},
  DataBase.DAO.Pessoa in '..\Source\DataBase\DAO\DataBase.DAO.Pessoa.pas',
  DataBase.BD.Funcoes in '..\Source\DataBase\DataBase.BD.Funcoes.pas',
  uFrmCrudPessoa in '..\Source\Pessoa\uFrmCrudPessoa.pas' {FrmCrudPessoa: TIWAppForm},
  Integracao.Telegram in '..\Source\Integracoes\Integracao.Telegram.pas',
  DataBase.Entity.Pessoa in '..\Source\DataBase\ENTITY\DataBase.Entity.Pessoa.pas',
  DataBase.Funcoes in '..\Source\Funcoes\DataBase.Funcoes.pas';

{$R *.res}

begin
  TIWStartHSys.Execute(True);
end.
