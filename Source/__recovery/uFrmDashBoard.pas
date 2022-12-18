unit uFrmDashBoard;

interface

uses

  RESTRequest4D,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompButton, IWCompLabel;

type
  TFrmDashBoard = class(TFrmBase)
    BTN_JS: TIWButton;
    TOTAL_VENDAS: TIWLabel;
    TOTAL_VENDAS_PERCT: TIWLabel;
    BTN_API: TIWButton;
    TOTAL_CLIENTES: TIWLabel;
    procedure BTN_JSAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure BTN_APIAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDashBoard: TFrmDashBoard;

implementation

{$R *.dfm}

procedure TFrmDashBoard.BTN_APIAsyncClick(Sender: TObject;
  EventParams: TStringList);
VAR
   LResponse   : IResponse;
    Body        : String;
    valorpedido : String;
begin
  inherited;


       LResponse := TRequest.New.BaseURL('http://localhost:9000/pedidos')
      .ContentType('application/json')
      .Accept('application/json')
      .Get;



      if LResponse.StatusCode = 200 then begin

         TOTAL_VENDAS.Text   :=  LResponse.Content;

      end;



       LResponse := TRequest.New.BaseURL('http://localhost:9000/cliente')
      .ContentType('application/json')
      .Accept('application/json')
      .Get;



      if LResponse.StatusCode = 200 then begin

         TOTAL_CLIENTES.Text   :=  LResponse.Content;

      end;









end;

procedure TFrmDashBoard.BTN_JSAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;

  WebApplication.ExecuteJS('minhafuncao();');


end;

procedure TFrmDashBoard.IWAppFormCreate(Sender: TObject);
begin
  inherited;

  TOTAL_VENDAS.Text         := 'R$ 189,69';
  TOTAL_VENDAS_PERCT.Text   := '79%';


end;

end.
