inherited FrmListaPedidos: TFrmListaPedidos
  Width = 1123
  Height = 475
  ExplicitWidth = 1123
  ExplicitHeight = 475
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  inherited BTN_POST: TIWButton
    Left = 144
    Top = 416
    ExplicitLeft = 144
    ExplicitTop = 416
  end
  inherited BTN_CANCEL: TIWButton
    Left = 288
    Top = 416
    ExplicitLeft = 288
    ExplicitTop = 416
  end
  object TIPO_PESQUISA: TIWComboBox [2]
    Left = 56
    Top = 75
    Width = 137
    Height = 21
    Css = 'form-select'
    StyleRenderOptions.RenderBorder = False
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Raz'#227'o / Nome'
      'CFP/CNPF')
    FriendlyName = 'TIPO_PESQUISA'
    NoSelectionText = '-- No Selection --'
  end
  object EDIT_PESQUISA: TIWEdit [3]
    Left = 199
    Top = 75
    Width = 456
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EDIT_PESQUISA'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object BTN_PESQUISAR: TIWButton [4]
    Left = 661
    Top = 70
    Width = 76
    Height = 30
    Caption = 'Pesquisar'
    Color = clBtnFace
    FriendlyName = 'BTN_PESQUISAR'
    OnAsyncClick = BTN_PESQUISARAsyncClick
  end
  object BTN_LIMPAR: TIWButton [5]
    Left = 743
    Top = 71
    Width = 90
    Height = 30
    Caption = 'BTN_LIMPAR'
    Color = clBtnFace
    FriendlyName = 'BTN_LIMPAR'
    OnAsyncClick = BTN_LIMPARAsyncClick
  end
  object DATAINI: TIWEdit [6]
    Left = 56
    Top = 128
    Width = 97
    Height = 25
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'DATAINI'
    SubmitOnAsyncEvent = True
    OnAsyncExit = DATAINIAsyncExit
    DataType = stDate
  end
  object DATAFIM: TIWEdit [7]
    Left = 159
    Top = 128
    Width = 105
    Height = 25
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'DATAFIM'
    SubmitOnAsyncEvent = True
    OnAsyncExit = DATAFIMAsyncExit
    DataType = stDate
  end
end
