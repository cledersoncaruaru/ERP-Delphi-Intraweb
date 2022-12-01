unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompEdit;

type
  TFrmLogin = class(TFrmBase)
    USUARIO: TIWEdit;
    SENHA: TIWEdit;
    BTN_LOGIN: TIWButton;
    procedure BTN_LOGINAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses uFrmDashBoard;


procedure TFrmLogin.BTN_LOGINAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;


   if USUARIO.Text = '' then begin

    WebApplication.ShowMessage('atenção usuario não pode ser vazio');
    Abort;


   end;


   if SENHA.Text = '' then begin

    WebApplication.ShowMessage('atenção Senha não pode ser vazio');
    Abort;

   end;

   WebApplication.ShowForm(TFrmDashBoard,True);


//WebApplication.ShowMessage('TESTE');

//QUALQUER COMENTARIO
end;

initialization
  TFrmLogin.SetAsMainForm;


end.
