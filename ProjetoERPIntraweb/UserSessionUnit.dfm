object IWUserSession: TIWUserSession
  OnCreate = IWUserSessionBaseCreate
  Height = 242
  Width = 414
  PixelsPerInch = 96
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'DriverID=FB')
    LoginPrompt = False
    Left = 144
    Top = 24
  end
end
