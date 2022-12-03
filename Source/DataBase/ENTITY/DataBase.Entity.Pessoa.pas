unit DataBase.Entity.Pessoa;

interface

uses
 Integracao.Telegram,
 ServerController,
 System.SysUtils, System.Classes;


 Type
 TPessoa = Class

   private
    FPES_CEP: String;
    FPES_NUMERO: String;
    FPES_WHATSAPP: String;
    FPES_CIDADE: String;
    FPES_RAZAO: String;
    FCOD_PESSOA: LongInt;
    FPES_LOGRADOURO: String;
    FPES_BAIRRO: String;
    FCOD_STATUS: LongInt;
    procedure SetCOD_PESSOA(const Value: LongInt);
    procedure SetCOD_STATUS(const Value: LongInt);
    procedure SetPES_BAIRRO(const Value: String);
    procedure SetPES_CEP(const Value: String);
    procedure SetPES_CIDADE(const Value: String);
    procedure SetPES_LOGRADOURO(const Value: String);
    procedure SetPES_NUMERO(const Value: String);
    procedure SetPES_RAZAO(const Value: String);
    procedure SetPES_WHATSAPP(const Value: String);




   public


    Property COD_PESSOA           : LongInt read FCOD_PESSOA write SetCOD_PESSOA;
    Property COD_STATUS           : LongInt read FCOD_STATUS write SetCOD_STATUS;
    Property PES_RAZAO            : String read FPES_RAZAO write SetPES_RAZAO;
    Property PES_CEP              : String read FPES_CEP write SetPES_CEP;
    Property PES_LOGRADOURO       : String read FPES_LOGRADOURO write SetPES_LOGRADOURO;
    Property PES_NUMERO           : String read FPES_NUMERO write SetPES_NUMERO;
    Property PES_BAIRRO           : String read FPES_BAIRRO write SetPES_BAIRRO;
    Property PES_CIDADE           : String read FPES_CIDADE write SetPES_CIDADE;
    Property PES_WHATSAPP         : String read FPES_WHATSAPP write SetPES_WHATSAPP;






 End;




implementation

{ TPessoa }


procedure TPessoa.SetCOD_PESSOA(const Value: LongInt);
begin
  FCOD_PESSOA := Value;
end;

procedure TPessoa.SetCOD_STATUS(const Value: LongInt);
begin
  FCOD_STATUS := Value;
end;

procedure TPessoa.SetPES_BAIRRO(const Value: String);
begin
  FPES_BAIRRO := Value;
end;

procedure TPessoa.SetPES_CEP(const Value: String);
begin
  FPES_CEP := Value;
end;

procedure TPessoa.SetPES_CIDADE(const Value: String);
begin
  FPES_CIDADE := Value;
end;

procedure TPessoa.SetPES_LOGRADOURO(const Value: String);
begin
  FPES_LOGRADOURO := Value;
end;

procedure TPessoa.SetPES_NUMERO(const Value: String);
begin
  FPES_NUMERO := Value;
end;

procedure TPessoa.SetPES_RAZAO(const Value: String);
begin
  FPES_RAZAO := Value;
end;

procedure TPessoa.SetPES_WHATSAPP(const Value: String);
begin
  FPES_WHATSAPP := Value;
end;

end.
