object FrmBase: TFrmBase
  Left = 0
  Top = 0
  Width = 721
  Height = 367
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  LayoutMgr = TPS
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  object TPS: TIWTemplateProcessorHTML
    MasterFormTag = False
    TagType = ttIntraWeb
    RenderStyles = False
    Left = 24
    Top = 8
  end
end
