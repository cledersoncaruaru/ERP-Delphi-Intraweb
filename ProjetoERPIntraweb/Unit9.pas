unit Unit9;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes;

type
  TFrmBase = class(TIWAppForm)
  public
  end;

implementation

{$R *.dfm}


initialization
  TFrmBase.SetAsMainForm;

end.
