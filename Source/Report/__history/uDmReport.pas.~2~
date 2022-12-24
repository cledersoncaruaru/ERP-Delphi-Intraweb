unit uDmReport;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet;

type
  TDmReport = class(TDataModule)
    Relatorio: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    DBRelatorio: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }

function Get_Report_Unidades(Page: TObject; TipoRelatorio, COD_UNIDADE, COD_STATUS,COD_DAV,COD_CLIENTE: LongInt; var Report: String;Cache: Boolean): Boolean;

  end;

var
  DmReport: TDmReport;

implementation

uses
  FireDAC.Comp.Client, ServerController;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmReport }


end.
