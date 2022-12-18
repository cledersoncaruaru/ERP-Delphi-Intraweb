inherited FrmListaPedidos: TFrmListaPedidos
  Width = 1123
  Height = 475
  ExplicitWidth = 1123
  ExplicitHeight = 475
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  inherited BTN_POST: TIWButton
    Left = 96
    Top = 416
    ExplicitLeft = 96
    ExplicitTop = 416
  end
  inherited BTN_CANCEL: TIWButton
    Left = 240
    Top = 416
    ExplicitLeft = 240
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
  object IWLabel1: TIWLabel [8]
    Left = 718
    Top = 160
    Width = 405
    Height = 45
    Font.Color = clMenuHighlight
    Font.Size = 25
    Font.Style = [fsBold]
    Font.PxSize = 33
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'MODAL DE IMPRESSAO'
  end
  object IMP_TIPO_IMPRESSAO: TIWComboBox [9]
    Left = 728
    Top = 211
    Width = 193
    Height = 21
    Css = 'form-select'
    StyleRenderOptions.RenderBorder = False
    ItemIndex = 1
    Items.Strings = (
      'CUPOM 40 COLUNAS'
      'IMPRESS'#195'O GRAFICO'
      'IMPRESS'#195'O RESUMIDA'
      '')
    FriendlyName = 'IMP_TIPO_IMPRESSAO'
    NoSelectionText = '-- No Selection --'
  end
  object IMP_WHATSAPP: TIWEdit [10]
    Left = 728
    Top = 238
    Width = 193
    Height = 27
    OnHTMLTag = IMP_WHATSAPPHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'IMP_WHATSAPP'
    SubmitOnAsyncEvent = True
  end
  object IMP_EMAIL: TIWEdit [11]
    Left = 728
    Top = 271
    Width = 193
    Height = 27
    OnHTMLTag = IMP_EMAILHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'IMP_EMAIL'
    SubmitOnAsyncEvent = True
  end
  object IMP_MSG: TIWMemo [12]
    Left = 728
    Top = 304
    Width = 369
    Height = 105
    OnHTMLTag = IMP_MSGHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = True
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    SubmitOnAsyncEvent = True
    FriendlyName = 'IMP_MSG'
    Lines.Strings = (
      
        'Enviando Mensagens Com o Nosso Servidor WhatsApp, Delphi + Intra' +
        'Web = Sua Aplica'#231#227'o VCL Delphi na Web')
  end
  object BTN_IMPRIMIR: TIWButton [13]
    Left = 728
    Top = 415
    Width = 120
    Height = 30
    Caption = 'IMPRIMIR'
    Color = clBtnFace
    FriendlyName = 'BTN_IMPRIMIR'
  end
  object BTN_WHATSAPP: TIWButton [14]
    Left = 854
    Top = 415
    Width = 120
    Height = 30
    Caption = 'WHATSAPP'
    Color = clBtnFace
    FriendlyName = 'BTN_WHATSAPP'
    OnAsyncClick = BTN_WHATSAPPAsyncClick
  end
end
