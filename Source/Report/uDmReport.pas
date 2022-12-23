unit uDmReport;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxExportBaseDialog, frxExportPDF;

type
  TDmReport = class(TDataModule)
    Relatorio: TfrxReport;
    frxPDFExport: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmReport: TDmReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
