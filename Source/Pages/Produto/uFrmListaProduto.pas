unit uFrmListaProduto;

interface

uses

 DataBase.DAO.Produto,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWCompEdit, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompListbox;

type
  TFrmListaProduto = class(TFrmBase)
    TIPO_PESQUISA: TIWComboBox;
    EDIT_PESQUISA: TIWEdit;
    BTN_PESQUISAR: TIWButton;
    BTN_LIMPAR: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
  private
    { Private declarations }



    procedure Prc_Crud(EventParams: TStringList);
    Procedure Listar(aParams: TStrings; out aResult: String);


  public
    { Public declarations }
  end;

var
  FrmListaProduto: TFrmListaProduto;

implementation

{$R *.dfm}

uses ServerController;

{ TFrmListaProduto }

procedure TFrmListaProduto.IWAppFormCreate(Sender: TObject);
begin
  inherited;

  RegisterCallBack('Produtos',Listar);
  RegisterCallBack('Crud',Prc_Crud);


end;

procedure TFrmListaProduto.Listar(aParams: TStrings; out aResult: String);
var
TipoPesquisa:LongInt;
begin

  TipoPesquisa  := StrToIntDef(TIPO_PESQUISA.SelectedValue,-1);

  Get_Lista_Produto(TipoPesquisa,aParams,aResult);

end;

procedure TFrmListaProduto.Prc_Crud(EventParams: TStringList);
begin


     if ( StrToIntDef(EventParams.Values['Edit'],-1) > 0)then begin

        UserSession.ID_Cadastro         := StrToIntDef(EventParams.Values['Edit'],0);

         WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=crud-produto'')');


      Exit;
    end;



end;

end.
