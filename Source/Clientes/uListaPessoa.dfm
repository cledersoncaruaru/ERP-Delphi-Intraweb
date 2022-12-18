inherited FrmListaPessoa: TFrmListaPessoa
  Width = 796
  Height = 435
  ExplicitWidth = 796
  ExplicitHeight = 435
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  object TIPO_PESQUISA: TIWComboBox [2]
    Left = 16
    Top = 67
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
    Left = 159
    Top = 67
    Width = 456
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EDIT_PESQUISA'
    SubmitOnAsyncEvent = True
    DataTypeOptions.StringCase = scUppercase
  end
  object BTN_PESQUISAR: TIWButton [4]
    Left = 621
    Top = 62
    Width = 76
    Height = 30
    Caption = 'BTN_PESQUISAR'
    Color = clBtnFace
    FriendlyName = 'BTN_PESQUISAR'
  end
  object BTN_LIMPAR: TIWButton [5]
    Left = 703
    Top = 63
    Width = 90
    Height = 30
    Caption = 'BTN_LIMPAR'
    Color = clBtnFace
    FriendlyName = 'BTN_LIMPAR'
    OnAsyncClick = BTN_LIMPARAsyncClick
  end
end
