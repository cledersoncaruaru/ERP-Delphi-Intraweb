unit uFrmCrudProduto;

interface

uses

  DataBase.Entity.Produto,
  DataBase.DAO.Produto,


  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompEdit, IWCompListbox, IWCompButton;

type
  TFrmCrudProduto = class(TFrmBase)
    COD_PRODUTO: TIWEdit;
    PRO_DESCRICAO: TIWEdit;
    PRO_COD_BARRA: TIWEdit;
    COD_NCM: TIWEdit;
    COD_UNIDADE: TIWComboBox;
    COD_GRUPO: TIWComboBox;
    PROD_VALOR: TIWEdit;
    procedure IWAppFormCreate(Sender: TObject);
    procedure BTN_CANCELAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure BTN_POSTAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
    vResult:String;
    Produto:TProduto;

    Procedure GravarDados;


  public
    { Public declarations }
  end;

var
  FrmCrudProduto: TFrmCrudProduto;

implementation

{$R *.dfm}

uses ServerController;

procedure TFrmCrudProduto.BTN_CANCELAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
 WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=lista-produto'')');

end;

procedure TFrmCrudProduto.BTN_POSTAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;

GravarDados;

end;

procedure TFrmCrudProduto.GravarDados;
begin



    if StrToCurrDef(PROD_VALOR.Text,0) <=0 then BEGIN


      PROD_VALOR.SetFocus;
      WebApplication.ExecuteJS('mensagem(''ATEN??O '','' Campo Valor N?o Preenchido'',''success'');');
      WebApplication.ExecuteJS('selecionatab();');
      Exit;

    end;


     try

      Produto.COD_PRODUTO        := StrToIntDef(COD_PRODUTO.Text,0);
      Produto.PRO_DESCRICAO      := trim(PRO_DESCRICAO.Text);
      Produto.PRO_COD_BARRA      := Trim(PRO_COD_BARRA.Text);
      Produto.COD_STATUS         := 1;


      if  Set_Produto(Produto,vResult) then begin

          UserSession.ID_Cadastro   := 0;

          WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=lista-produto'')');


      end;




     except on E: Exception do

        WebApplication.ExecuteJS('mensagem(''ATEN??O '','' Erro ao Gravar os Produtos' +vResult+',''error'');');

     end;



end;

procedure TFrmCrudProduto.IWAppFormCreate(Sender: TObject);
begin
  inherited;



  try

    Produto   := TProduto.Create;


     if UserSession.ID_Cadastro >0 then begin


      Get_Produto(UserSession.ID_Cadastro,Produto,vResult);

      COD_PRODUTO.Text        := Produto.COD_PRODUTO.ToString;
      PRO_DESCRICAO.Text      := produto.PRO_DESCRICAO;
      PRO_COD_BARRA.Text      := Produto.PRO_COD_BARRA;
      COD_NCM.Text            := Produto.COD_NCM;


      COD_UNIDADE.Text        := Produto.COD_UNIDADE.ToString;
      COD_GRUPO.Text          := Produto.COD_GRUPO.ToString;


     end else begin


      // vamos fazer depois


     end;





  finally



  end;







end;

procedure TFrmCrudProduto.IWAppFormDestroy(Sender: TObject);
begin
  inherited;

 Produto.Free


end;

end.
