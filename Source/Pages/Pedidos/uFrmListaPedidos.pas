unit uFrmListaPedidos;

interface

uses

   DataBase.DAO.Pedidos,
   Integracao.Whatsapp,
   System.DateUtils,
   IWApplication,
   IWTypes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompButton, IWCompEdit, IWCompListbox, IWCompMemo, IWCompLabel,
  IWHTMLTag, IWBaseComponent, IWBaseHTMLComponent, IWBaseHTML40Component,
  IWCompExtCtrls,IWMimeTypes, IWCompCheckbox;

type
  TFrmListaPedidos = class(TFrmBase)
    TIPO_PESQUISA: TIWComboBox;
    EDIT_PESQUISA: TIWEdit;
    BTN_PESQUISAR: TIWButton;
    BTN_LIMPAR: TIWButton;
    DATAINI: TIWEdit;
    DATAFIM: TIWEdit;
    IWLabel1: TIWLabel;
    IMP_TIPO_IMPRESSAO: TIWComboBox;
    IMP_WHATSAPP: TIWEdit;
    IMP_EMAIL: TIWEdit;
    IMP_MSG: TIWMemo;
    BTN_IMPRIMIR: TIWButton;
    BTN_WHATSAPP: TIWButton;
    IWModalWindow1: TIWModalWindow;
    BTN_MENSAGEM: TIWButton;
    IWRadioGroup1: TIWRadioGroup;
    edtMessage: TIWEdit;
    IWLabel2: TIWLabel;
    chkTitle: TIWCheckBox;
    edtTitle: TIWEdit;
    procedure IWAppFormCreate(Sender: TObject);
    procedure BTN_LIMPARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure DATAINIAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure DATAFIMAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure BTN_PESQUISARAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure IMP_WHATSAPPHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure IMP_EMAILHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure IMP_MSGHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure BTN_WHATSAPPAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTN_IMPRIMIRAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTN_MENSAGEMAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }

      vDATAINI  : TDate;
      vDATAFIM  : TDate;
      aResponse :String;

      procedure Prc_Crud(EventParams: TStringList);
      Procedure Listar(aParams: TStrings; out aResult: String);

      procedure ShowDialogs(const Msg, Title: string; Option: Integer);


      procedure MyConfirmCallback(EventParams: TStringList);
      procedure MyPromptCallback(EventParams: TStringList);




  public
    { Public declarations }
  end;

var
  FrmListaPedidos: TFrmListaPedidos;

implementation

{$R *.dfm}

uses ServerController;

{ TFrmListaPedidos }

procedure TFrmListaPedidos.BTN_IMPRIMIRAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;

   case IMP_TIPO_IMPRESSAO.ItemIndex of

    0 : begin


          IWModalWindow1.Reset;
          IWModalWindow1.Autosize       := false;
          IWModalWindow1.Title          := 'Meu Relatório';
          IWModalWindow1.Draggable      := False;
          IWModalWindow1.WindowWidth    := 100;
          IWModalWindow1.WindowHeight   := 100;
          IWModalWindow1.Src            := 'Sample.pdf';
          IWModalWindow1.OnAsyncClick   := nil;
          IWModalWindow1.Show;



        end;


   1 : begin

//         WebApplication.SendFile('Z:\IntraWeb\Cursos\ERPIntraweb\Bin\wwwroot\Sample.pdf',
//                                 false,
//                                 TIWMimeTypes.GetAsString(mtpdf),'');


          WebApplication.CallBackResponse.AddJavaScriptToExecute('window.open("\Sample.pdf",''"_blank"'');');




       end;





   end;


end;

procedure TFrmListaPedidos.BTN_LIMPARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
WebApplication.ExecuteJS('fncclear();');
end;

procedure TFrmListaPedidos.BTN_MENSAGEMAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  aTitle: string;
begin
  aTitle := edtTitle.Text;
  if not chkTitle.Checked then
    aTitle := '';  // empty title is not shown in dialog!
  ShowDialogs(edtMessage.Text, aTitle, IWRadioGroup1.ItemIndex + 1);



//  WebApplication.ShowMessage('teste de mensagem');

//WebApplication.ShowConfirm('Mensagem',)


end;

procedure TFrmListaPedidos.BTN_PESQUISARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;



  WebApplication.CallBackResponse.AddJavaScriptToExecute('fncPsqSearching();');

end;

procedure TFrmListaPedidos.BTN_WHATSAPPAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;

//    WebApplication.ExecuteJS('mensagem(''Aguarde um Momento, Estamos Enviando o Seu Pedido por WhatsApp'');');



      try

    //     todas as verificações
    //    pegar o codigo do cliente
    //    pega o nome do cliente
    //    pega o endereço do cliente
    //   verifica se o telefone é valido


          if  Enviar_Whatsapp(IMP_WHATSAPP.Text,'Pedido Nº'+ IntToStr(UserSession.ID_Cadastro)+IMP_MSG.Lines.Text,aResponse) then
        begin

          WebApplication.ExecuteJS('$(''#modalimpressao'').modal(''hide'');');
          WebApplication.ShowMessage('Sua Mensagem do WhatsApp foi Enviada Com Sucesso');


        end;

          Sleep(5000);



      finally

       WebApplication.ExecuteJS('HoldOn.close();');

      end;



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

procedure TFrmListaPedidos.IMP_EMAILHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
  Atag.Add('placeholder=" Informe Seu Email"');
end;

procedure TFrmListaPedidos.IMP_MSGHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
  Atag.Add('placeholder=" Mensagem ao Cliente "');
end;

procedure TFrmListaPedidos.IMP_WHATSAPPHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  inherited;


  Atag.Add('placeholder=" WhatsApp"');

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


  // calback para as mensagens


  RegisterCallBack('MyConfirmCallback', MyConfirmCallback);
  RegisterCallBack('MyPromptCallback', MyPromptCallback);





end;

procedure TFrmListaPedidos.Listar(aParams: TStrings; out aResult: String);
var
TipoPesquisa:LongInt;
begin

  TipoPesquisa  := StrToIntDef(TIPO_PESQUISA.SelectedValue,-1);

  Get_Lista_Pedidos(0,0,vDATAINI,vDATAFIM,0,0, aParams,aResult);


end;

procedure TFrmListaPedidos.MyConfirmCallback(EventParams: TStringList);
var
  Response: Boolean;
  SelectedButton: string;
  MsgType: TIWNotifyType;
begin
  // Confirm callback has 1 main parameters:
  // RetValue (Boolean), indicates if the first button (Yes/OK/custom) was choosen
  Response := SameText(EventParams.Values['RetValue'], 'True');
  if Response then begin
    SelectedButton := 'Yes';
    MsgType := ntSuccess;
  end
  else begin
    SelectedButton := 'No';
    MsgType := ntError;
  end;
  WebApplication.ShowNotification('This is the callback. ' +
                                  'The selected button was: ' + SelectedButton,
                                  MsgType);
end;

procedure TFrmListaPedidos.MyPromptCallback(EventParams: TStringList);
var
  Response: Boolean;
  InputValue: string;
  SelectedButton: string;
  MsgType: TIWNotifyType;
  Msg: string;
begin
  // Prompt callback has 2 main parameters:
  // RetValue (Boolean), indicates if the first button (Yes/OK/custom) was choosen
  // InputStr, contains the string entered in the input box
  Response := SameText(EventParams.Values['RetValue'], 'True');
  InputValue := EventParams.Values['InputStr'];
  if Response then begin
    SelectedButton := 'OK';
    MsgType := ntSuccess;
  end
  else begin
    SelectedButton := 'Cancel';
    MsgType := ntError;
  end;
  Msg := 'This is the callback. The selected button was: ' + SelectedButton;
  if Response then
    Msg := Msg + ', and the string entered was: ' + InputValue;

  WebApplication.ShowNotification(Msg, MsgType);
end;

procedure TFrmListaPedidos.Prc_Crud(EventParams: TStringList);
begin

    aResponse:='';

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





    if ( StrToIntDef(EventParams.Values['Imprimir'],-1) > 0)then begin

      UserSession.ID_Cadastro         := StrToIntDef(EventParams.Values['Imprimir'],-1);
      WebApplication.ExecuteJS('$(''#modalimpressao'').modal(''show'');');

    end;





end;

procedure TFrmListaPedidos.ShowDialogs(const Msg, Title: string;
  Option: Integer);
begin
   case Option of
    1: WebApplication.ShowMessage(Msg);
    2: WebApplication.ShowConfirm(Msg, 'MyConfirmCallback', Title, 'Yes', 'No');
    3: WebApplication.ShowPrompt(Msg,  'MyPromptCallback', Title, 'This is the default value');
    4: WebApplication.ShowNotification(Msg);
  end;
end;

end.
