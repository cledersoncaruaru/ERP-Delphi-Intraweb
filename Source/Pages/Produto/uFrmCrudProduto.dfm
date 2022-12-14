inherited FrmCrudProduto: TFrmCrudProduto
  OnDestroy = IWAppFormDestroy
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  inherited BTN_POST: TIWButton
    OnAsyncClick = BTN_POSTAsyncClick
  end
  inherited BTN_CANCEL: TIWButton
    OnAsyncClick = BTN_CANCELAsyncClick
  end
  object COD_PRODUTO: TIWEdit [2]
    Left = 40
    Top = 72
    Width = 105
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Editable = False
    FriendlyName = '0'
    SubmitOnAsyncEvent = True
    Enabled = False
    Text = '0'
  end
  object PRO_DESCRICAO: TIWEdit [3]
    Left = 151
    Top = 72
    Width = 430
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PRO_DESCRICAO'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object PRO_COD_BARRA: TIWEdit [4]
    Left = 587
    Top = 72
    Width = 131
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PRO_COD_BARRA'
    SubmitOnAsyncEvent = True
  end
  object COD_NCM: TIWEdit [5]
    Left = 294
    Top = 99
    Width = 105
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'COD_NCM'
    SubmitOnAsyncEvent = True
  end
  object COD_UNIDADE: TIWComboBox [6]
    Left = 40
    Top = 103
    Width = 121
    Height = 21
    Css = 'form-select'
    StyleRenderOptions.RenderBorder = False
    ItemIndex = -1
    FriendlyName = 'COD_UNIDADE'
    NoSelectionText = '-- No Selection --'
  end
  object COD_GRUPO: TIWComboBox [7]
    Left = 167
    Top = 103
    Width = 121
    Height = 21
    Css = 'form-select'
    StyleRenderOptions.RenderBorder = False
    ItemIndex = -1
    FriendlyName = 'COD_GRUPO'
    NoSelectionText = '-- No Selection --'
  end
  object PROD_VALOR: TIWEdit [8]
    Left = 40
    Top = 195
    Width = 105
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'PROD_VALOR'
    SubmitOnAsyncEvent = True
  end
end
