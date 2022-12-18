inherited FrmListaProduto: TFrmListaProduto
  Width = 908
  ExplicitWidth = 908
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  object TIPO_PESQUISA: TIWComboBox [0]
    Left = 16
    Top = 72
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o'
      'EAN')
    FriendlyName = 'TIPO_PESQUISA'
    NoSelectionText = '-- No Selection --'
  end
  object EDIT_PESQUISA: TIWEdit [1]
    Left = 143
    Top = 72
    Width = 528
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EDIT_PESQUISA'
    SubmitOnAsyncEvent = True
  end
  object BTN_PESQUISAR: TIWButton [2]
    Left = 677
    Top = 70
    Width = 120
    Height = 30
    Caption = 'Pesquisar'
    Color = clBtnFace
    FriendlyName = 'BTN_PESQUISAR'
  end
  object BTN_LIMPAR: TIWButton [3]
    Left = 800
    Top = 69
    Width = 93
    Height = 30
    Caption = 'Limpar'
    Color = clBtnFace
    FriendlyName = 'BTN_LIMPAR'
  end
end
