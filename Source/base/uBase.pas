unit uBase;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML,System.StrUtils;

type
  TFrmBase = class(TIWAppForm)
    TPS: TIWTemplateProcessorHTML;
    procedure IWAppFormCreate(Sender: TObject);
  public

  Procedure Menu(EventParams: TStringList);


  end;

implementation

{$R *.dfm}

uses uFrmDashBoard, uFrmLogin, uListaPessoa, uFrmCrudPessoa;


procedure TFrmBase.IWAppFormCreate(Sender: TObject);
begin

   RegisterCallBack('Menu',Menu);



  if self.Name = 'FrmLogin' then begin

     TPS.Templates.Default := '/FrmLogin.html';

  end else begin

    TPS.MasterTemplate          := '/master.html';
     TPS.Templates.Default       := '/'+self.Name+'.html';

  end;




end;


procedure TFrmBase.Menu(EventParams: TStringList);
var
 vFormname, Page : string;
begin


  Page  := EventParams.Values['page'];


  case AnsiIndexStr(Page,['login','dashboard','lista-pessoa','crud-pessoa']) of

   0 : vFormname := 'FRMLOGIN';
   1 : vFormname := 'FRMDASHBOARD';
   2 : vFormname := 'FRMLISTAPESSOA';
   3 : vFormname := 'FRMCRUDPESSOA';



  end;


   if (UpperCase(WebApplication.ActiveForm.Name) = vFormname) then
   exit;

   self.Release;



    case AnsiIndexStr(Page,['login','dashboard','lista-pessoa','crud-pessoa']) of



     0 : begin

         WebApplication.ShowForm(TFrmLogin,True);

         end;

     1 : begin

         WebApplication.ShowForm(TFrmDashBoard,True);

         end;

     2 : begin

         WebApplication.ShowForm(TFrmListaPessoa,True);

         end;

     3 : begin

         WebApplication.ShowForm(TFrmCrudPessoa,True);

         end;



    end;




end;

end.
