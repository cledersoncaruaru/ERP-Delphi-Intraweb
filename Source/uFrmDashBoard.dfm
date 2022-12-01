inherited FrmDashBoard: TFrmDashBoard
  PixelsPerInch = 96
  DesignLeft = 2
  DesignTop = 2
  object BTN_JS: TIWButton [0]
    Left = 80
    Top = 104
    Width = 120
    Height = 30
    Caption = 'BTN_JS'
    Color = clBtnFace
    FriendlyName = 'BTN_JS'
    OnAsyncClick = BTN_JSAsyncClick
  end
  object TOTAL_VENDAS: TIWLabel [1]
    Left = 34
    Top = 168
    Width = 101
    Height = 17
    HasTabOrder = False
    FriendlyName = 'TOTAL_VENDAS'
    Caption = 'TOTAL_VENDAS'
    RawText = True
  end
  object TOTAL_VENDAS_PERCT: TIWLabel [2]
    Left = 34
    Top = 191
    Width = 147
    Height = 17
    HasTabOrder = False
    FriendlyName = 'TOTAL_VENDAS_PERCT'
    Caption = 'TOTAL_VENDAS_PERCT'
  end
end
