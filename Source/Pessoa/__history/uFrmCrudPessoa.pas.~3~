unit uFrmCrudPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWCompMemo, IWCompListbox,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompEdit;

type
  TFrmCrudPessoa = class(TFrmBase)
    CODIGO: TIWEdit;
    STATUS: TIWComboBox;
    NOME: TIWEdit;
    ENDERECO: TIWEdit;
    NUMERO: TIWEdit;
    BAIRRO: TIWEdit;
    CIDADE: TIWEdit;
    CEP: TIWEdit;
    WHATSAPP: TIWEdit;
    OBS: TIWMemo;
    BTN_POST: TIWButton;
    BTN_CANCEL: TIWButton;
    procedure BTN_CANCELAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCrudPessoa: TFrmCrudPessoa;

implementation

{$R *.dfm}

procedure TFrmCrudPessoa.BTN_CANCELAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;

  WebApplication.ExecuteJS('ajaxCall(''Menu'',''page=lista-pessoa'')');


end;

end.
