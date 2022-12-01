unit Integracao.Telegram;

interface

uses
IWTelegram;

Function Telegram_Send(Msg:String) :Boolean;


  Const
   Telegram_Tokem = '';
   Telegram_ID    = '';



implementation

uses
  System.SysUtils;


  Function Telegram_Send(Msg:String) :Boolean;
begin
  TIWTelegramHelper.SendMessageAsync(Telegram_Tokem, Telegram_ID, Msg);
end;


end.
