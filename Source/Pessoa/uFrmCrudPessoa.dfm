inherited FrmCrudPessoa: TFrmCrudPessoa
  Width = 747
  Height = 522
  ExplicitWidth = 747
  ExplicitHeight = 522
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = -71
  object COD_PESSOA: TIWEdit [2]
    Left = 24
    Top = 72
    Width = 113
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Editable = False
    FriendlyName = 'COD_PESSOA'
    SubmitOnAsyncEvent = True
    Enabled = False
  end
  object COD_STATUS: TIWComboBox [3]
    Left = 143
    Top = 72
    Width = 121
    Height = 21
    Css = 'form-select'
    StyleRenderOptions.RenderBorder = False
    ItemIndex = 1
    Items.Strings = (
      'Ativo'
      'Cancelado')
    FriendlyName = 'COD_STATUS'
    NoSelectionText = '-- No Selection --'
  end
  object PES_RAZAO: TIWEdit [4]
    Left = 24
    Top = 99
    Width = 609
    Height = 21
    OnHTMLTag = PES_RAZAOHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PES_RAZAO'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object PES_LOGRADOURO: TIWEdit [5]
    Left = 24
    Top = 151
    Width = 369
    Height = 21
    OnHTMLTag = PES_LOGRADOUROHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PES_LOGRADOURO'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object PES_NUMERO: TIWEdit [6]
    Left = 399
    Top = 151
    Width = 58
    Height = 21
    OnHTMLTag = PES_NUMEROHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PES_NUMERO'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object PES_BAIRRO: TIWEdit [7]
    Left = 24
    Top = 178
    Width = 369
    Height = 21
    OnHTMLTag = PES_BAIRROHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PES_BAIRRO'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object PES_CIDADE: TIWEdit [8]
    Left = 399
    Top = 178
    Width = 234
    Height = 21
    OnHTMLTag = PES_CIDADEHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PES_CIDADE'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object PES_CEP: TIWEdit [9]
    Left = 24
    Top = 126
    Width = 114
    Height = 21
    OnHTMLTag = PES_CEPHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PES_CEP'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object PES_WHATSAPP: TIWEdit [10]
    Left = 24
    Top = 205
    Width = 137
    Height = 21
    OnHTMLTag = PES_WHATSAPPHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PES_WHATSAPP'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object OBS: TIWMemo [11]
    Left = 24
    Top = 236
    Width = 609
    Height = 121
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = True
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    SubmitOnAsyncEvent = True
    FriendlyName = 'OBS'
  end
end
