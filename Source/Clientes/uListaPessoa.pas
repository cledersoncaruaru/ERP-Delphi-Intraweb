unit uListaPessoa;

interface

uses

  DataBase.DAO.Pessoa,


  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWCompEdit, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompListbox;

type
  TFrmListaPessoa = class(TFrmBase)
    TIPO_PESQUISA: TIWComboBox;
    EDIT_PESQUISA: TIWEdit;
    BTN_PESQUISAR: TIWButton;
    BTN_LIMPAR: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure BTN_LIMPARAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }

    procedure Prc_Crud(EventParams: TStringList);
    Procedure Listar(aParams: TStrings; out aResult: String);

  public
    { Public declarations }
  end;

var
  FrmListaPessoa: TFrmListaPessoa;

implementation

{$R *.dfm}

procedure TFrmListaPessoa.BTN_LIMPARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;

 WebApplication.ExecuteJS('fncclear();');



end;

procedure TFrmListaPessoa.IWAppFormCreate(Sender: TObject);
begin
  inherited;


  RegisterCallBack('Pessoa',Listar);
  RegisterCallBack('Crud', Prc_Crud);


end;

procedure TFrmListaPessoa.Listar(aParams: TStrings; out aResult: String);
var
TipoPesquisa:LongInt;
begin

  TipoPesquisa  := StrToIntDef(TIPO_PESQUISA.SelectedValue,-1);

      Get_Lista_Pessoa(TipoPesquisa,aParams,aResult);
end;

procedure TFrmListaPessoa.Prc_Crud(EventParams: TStringList);
begin



     if ( StrToIntDef(EventParams.Values['Edit'],-1) > 0)then begin
//      UserSession.Cadastro_PK         := str2Num(EventParams.Values['Edit']);
        WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=crud-pessoa'')');

//        WebApplication.ShowMessage(EventParams.Values['Edit'] );

      Exit;
    end;


end;

end.
