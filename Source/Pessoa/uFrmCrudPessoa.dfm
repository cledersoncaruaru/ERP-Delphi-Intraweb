inherited FrmCrudPessoa: TFrmCrudPessoa
  Width = 747
  Height = 404
  ExplicitWidth = 747
  ExplicitHeight = 404
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  object CODIGO: TIWEdit [0]
    Left = 24
    Top = 72
    Width = 113
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'CODIGO'
    SubmitOnAsyncEvent = True
    Text = 'CODIGO'
  end
  object STATUS: TIWComboBox [1]
    Left = 143
    Top = 72
    Width = 121
    Height = 21
    Css = 'form-select'
    StyleRenderOptions.RenderBorder = False
    ItemIndex = -1
    FriendlyName = 'STATUS'
    NoSelectionText = '-- No Selection --'
  end
  object NOME: TIWEdit [2]
    Left = 24
    Top = 99
    Width = 609
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'NOME'
    SubmitOnAsyncEvent = True
    Text = 'NOME'
  end
  object ENDERECO: TIWEdit [3]
    Left = 24
    Top = 151
    Width = 369
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'ENDERECO'
    SubmitOnAsyncEvent = True
    Text = 'ENDE'#199'O'
  end
  object NUMERO: TIWEdit [4]
    Left = 399
    Top = 151
    Width = 58
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'NUMERO'
    SubmitOnAsyncEvent = True
    Text = 'NUMERO'
  end
  object BAIRRO: TIWEdit [5]
    Left = 24
    Top = 178
    Width = 369
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'BAIRRO'
    SubmitOnAsyncEvent = True
    Text = 'BAIRRO'
  end
  object CIDADE: TIWEdit [6]
    Left = 399
    Top = 178
    Width = 234
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'CIDADE'
    SubmitOnAsyncEvent = True
    Text = 'CIDADE'
  end
  object CEP: TIWEdit [7]
    Left = 24
    Top = 126
    Width = 114
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'CEP'
    SubmitOnAsyncEvent = True
    Text = 'CEP'
  end
  object WHATSAPP: TIWEdit [8]
    Left = 24
    Top = 205
    Width = 137
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'WHATSAPP'
    SubmitOnAsyncEvent = True
    Text = 'WHATSAPP'
  end
  object OBS: TIWMemo [9]
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
  object BTN_POST: TIWButton [10]
    Left = 176
    Top = 363
    Width = 120
    Height = 30
    Caption = 'GRAVAR'
    Color = clBtnFace
    FriendlyName = 'BTN_POST'
  end
  object BTN_CANCEL: TIWButton [11]
    Left = 313
    Top = 363
    Width = 120
    Height = 30
    Caption = 'CANCELAR'
    Color = clBtnFace
    FriendlyName = 'BTN_CANCEL'
    OnAsyncClick = BTN_CANCELAsyncClick
  end
end
