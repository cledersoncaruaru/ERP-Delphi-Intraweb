object IWUserSession: TIWUserSession
  OnCreate = IWUserSessionBaseCreate
  Height = 242
  Width = 414
  PixelsPerInch = 96
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=Z:\IntraWeb\Cursos\ERPIntraweb\Bin\Files\Clientes\00000' +
        '000000000\BD\DADOS'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'DriverID=FB')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
end
