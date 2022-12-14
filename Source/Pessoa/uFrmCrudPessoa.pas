unit uFrmCrudPessoa;

interface

uses

  DataBase.Entity.Pessoa,
  DataBase.DAO.Pessoa,





  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWCompMemo, IWCompListbox,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompEdit,IWHTMLTag;

type
  TFrmCrudPessoa = class(TFrmBase)
    COD_PESSOA: TIWEdit;
    COD_STATUS: TIWComboBox;
    PES_RAZAO: TIWEdit;
    PES_LOGRADOURO: TIWEdit;
    PES_NUMERO: TIWEdit;
    PES_BAIRRO: TIWEdit;
    PES_CIDADE: TIWEdit;
    PES_CEP: TIWEdit;
    PES_WHATSAPP: TIWEdit;
    OBS: TIWMemo;

    procedure PES_RAZAOHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure PES_CEPHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure PES_LOGRADOUROHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure PES_NUMEROHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure PES_BAIRROHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure PES_CIDADEHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure PES_WHATSAPPHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
  private
    { Private declarations }

    Procedure Gravar;



  public
    { Public declarations }
  end;

var
  FrmCrudPessoa: TFrmCrudPessoa;

implementation

{$R *.dfm}





procedure TFrmCrudPessoa.Gravar;
var
Pessoa   : TPessoa;
vResult  :String;
begin


  if Length(PES_RAZAO.Text) <= 0 then begin

    PES_RAZAO.SetFocus;
    WebApplication.ExecuteJS('mensagem(''Titulo da Mensagem '',''a mensagem que eu quero mostrar'',''success'');');
//    WebApplication.ExecuteJS('mensagem(''Titulo da Mensagem'',''Texto da Mensagem que eu quero'',''success'');');


    //    WebApplication.ShowMessage('Nome do Cliente N?o pode ser vazio Verifique !!!');

    Exit;

  end;


   try

    Pessoa := TPessoa.Create;


    Pessoa.COD_PESSOA               := StrToIntDef(COD_PESSOA.Text,0);
    Pessoa.COD_STATUS               := COD_STATUS.ItemIndex;
    Pessoa.PES_RAZAO                := Trim(PES_RAZAO.Text);
    Pessoa.PES_CEP                  := Trim(PES_CEP.Text);
    Pessoa.PES_LOGRADOURO           := Trim(PES_LOGRADOURO.Text);
    Pessoa.PES_NUMERO               := Trim(PES_NUMERO.Text);
    Pessoa.PES_BAIRRO               := Trim(PES_BAIRRO.Text);
    Pessoa.PES_CIDADE               := Trim(PES_CIDADE.Text);
    Pessoa.PES_WHATSAPP             := Trim(PES_WHATSAPP.Text);



     if Set_Pessoa(Pessoa,vResult) then  begin

      WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=lista-pessoa'')');


     end else begin



     end;


   finally

   Pessoa.free;

   end;


end;

procedure TFrmCrudPessoa.PES_BAIRROHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
  Atag.Add('placeholder=" Informe o Bairro "');
end;

procedure TFrmCrudPessoa.PES_CEPHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
     Atag.Add('placeholder=" Informe o Cep "');
end;

procedure TFrmCrudPessoa.PES_CIDADEHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
  Atag.Add('placeholder=" Informe a Cidade "');
end;

procedure TFrmCrudPessoa.PES_LOGRADOUROHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  inherited;
  Atag.Add('placeholder=" Informe o Seu Endere?o "');
end;

procedure TFrmCrudPessoa.PES_NUMEROHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
  Atag.Add('placeholder=" Informe o N?mero "');
end;

procedure TFrmCrudPessoa.PES_RAZAOHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;

  Atag.Add('placeholder=" Informe o Nome/Raz?o Social "');


end;

procedure TFrmCrudPessoa.PES_WHATSAPPHTMLTag(ASender: TObject;
  ATag: TIWHTMLTag);
begin
  inherited;
  Atag.Add('placeholder=" Informe o WhatsApp"');
end;

end.
