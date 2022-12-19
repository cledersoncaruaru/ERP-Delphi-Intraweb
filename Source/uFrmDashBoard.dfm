inherited FrmDashBoard: TFrmDashBoard
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  object BTN_JS: TIWButton [2]
    Left = 80
    Top = 104
    Width = 120
    Height = 30
    Caption = 'BTN_JS'
    Color = clBtnFace
    FriendlyName = 'BTN_JS'
    OnAsyncClick = BTN_JSAsyncClick
  end
  object TOTAL_VENDAS: TIWLabel [3]
    Left = 34
    Top = 168
    Width = 101
    Height = 17
    HasTabOrder = False
    FriendlyName = 'TOTAL_VENDAS'
    Caption = 'TOTAL_VENDAS'
    RawText = True
  end
  object TOTAL_VENDAS_PERCT: TIWLabel [4]
    Left = 34
    Top = 191
    Width = 147
    Height = 17
    HasTabOrder = False
    FriendlyName = 'TOTAL_VENDAS_PERCT'
    Caption = 'TOTAL_VENDAS_PERCT'
  end
  object BTN_API: TIWButton [5]
    Left = 528
    Top = 128
    Width = 120
    Height = 30
    Caption = 'BTN_API'
    Color = clBtnFace
    FriendlyName = 'BTN_API'
    OnAsyncClick = BTN_APIAsyncClick
  end
  object TOTAL_CLIENTES: TIWLabel [6]
    Left = 34
    Top = 214
    Width = 107
    Height = 17
    HasTabOrder = False
    FriendlyName = 'TOTAL_CLIENTES'
    Caption = 'TOTAL_CLIENTES'
  end
  object grafico_google: TIWLabel [7]
    Left = 336
    Top = 104
    Width = 96
    Height = 17
    HasTabOrder = False
    FriendlyName = 'grafico_google'
    Caption = 'grafico_google'
    RawText = True
  end
end
