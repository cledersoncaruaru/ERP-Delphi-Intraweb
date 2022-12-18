unit uFrmListaPedidos;

interface

uses

   DataBase.DAO.Pedidos,
   Integracao.Whatsapp,
   System.DateUtils,



  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompButton, IWCompEdit, IWCompListbox;

type
  TFrmListaPedidos = class(TFrmBase)
    TIPO_PESQUISA: TIWComboBox;
    EDIT_PESQUISA: TIWEdit;
    BTN_PESQUISAR: TIWButton;
    BTN_LIMPAR: TIWButton;
    DATAINI: TIWEdit;
    DATAFIM: TIWEdit;
    procedure IWAppFormCreate(Sender: TObject);
    procedure BTN_LIMPARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure DATAINIAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure DATAFIMAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure BTN_PESQUISARAsyncClick(Sender: TObject;
      EventParams: TStringList);
  private
    { Private declarations }

      vDATAINI : TDate;
      vDATAFIM : TDate;

      procedure Prc_Crud(EventParams: TStringList);
      Procedure Listar(aParams: TStrings; out aResult: String);


  public
    { Public declarations }
  end;

var
  FrmListaPedidos: TFrmListaPedidos;

implementation

{$R *.dfm}

uses ServerController;

{ TFrmListaPedidos }

procedure TFrmListaPedidos.BTN_LIMPARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
WebApplication.ExecuteJS('fncclear();');
end;

procedure TFrmListaPedidos.BTN_PESQUISARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;



  WebApplication.CallBackResponse.AddJavaScriptToExecute('fncPsqSearching();');

end;

procedure TFrmListaPedidos.DATAFIMAsyncExit(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  vDATAFIM           := StrToDate(DATAFIM.Text);
end;

procedure TFrmListaPedidos.DATAINIAsyncExit(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  vDATAINI           := StrToDate(DATAINI.Text);
end;

procedure TFrmListaPedidos.IWAppFormCreate(Sender: TObject);
begin
  inherited;



  DATAINI.Text       := DateToStr(StartofTheMonth(Now));
  DATAFIM.Text       := DateToStr(EndofTheMonth(Now));

  vDATAINI           := StrToDate(DATAINI.Text);
  vDATAFIM           := StrToDate(DATAFIM.Text);



    RegisterCallBack('Pedido',Listar);
    RegisterCallBack('Crud', Prc_Crud);


end;

procedure TFrmListaPedidos.Listar(aParams: TStrings; out aResult: String);
var
TipoPesquisa:LongInt;
begin

  TipoPesquisa  := StrToIntDef(TIPO_PESQUISA.SelectedValue,-1);

  Get_Lista_Pedidos(0,0,vDATAINI,vDATAFIM,0,0, aParams,aResult);


end;

procedure TFrmListaPedidos.Prc_Crud(EventParams: TStringList);
Var
aResponse:String;
begin

     if ( StrToIntDef(EventParams.Values['Edit'],-1) > 0)then begin

        UserSession.ID_Cadastro         := StrToIntDef(EventParams.Values['Edit'],-1);
//        WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=crud-pessoa'')');

      Exit;
    end;



    if ( StrToIntDef(EventParams.Values['Zap'],-1) > 0)then begin

//        UserSession.ID_Cadastro         := StrToIntDef(EventParams.Values['Edit'],-1);
//        WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=crud-pessoa'')');

       if  Enviar_Whatsapp('81991942572','Pedido Nº'+EventParams.Values['Zap']+'teste de mensagem do whatsapp Delphi + IntraWeb = Sua Aplicação VCL Delphi na Web',aResponse) then
       begin

       WebApplication.ShowMessage('Sua Mensagem do WhatsApp foi enviada Com Sucesso');

       end;


      Exit;
    end;




end;

end.
