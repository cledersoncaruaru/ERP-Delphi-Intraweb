unit uFrmDashBoard;

interface

uses
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
    procedure BTN_JSAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDashBoard: TFrmDashBoard;

implementation

{$R *.dfm}

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
