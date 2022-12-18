unit DataBase.Entity.Produto;

interface

uses
 Integracao.Telegram,
 ServerController,
 System.SysUtils, System.Classes;


 Type
 TProduto = Class

   private
    FPRO_CADASTRO: TDate;
    FCOD_UNIDADE: LongInt;
    FCOD_GRUPO: LongInt;
    FCOD_PRODUTO: LongInt;
    FPRO_DESCRICAO: String;
    FPRO_COD_BARRA: String;
    FCOD_NCM: String;
    FCOD_STATUS: LongInt;
    procedure SetCOD_GRUPO(const Value: LongInt);
    procedure SetCOD_NCM(const Value: String);
    procedure SetCOD_PRODUTO(const Value: LongInt);
    procedure SetCOD_STATUS(const Value: LongInt);
    procedure SetCOD_UNIDADE(const Value: LongInt);
    procedure SetPRO_CADASTRO(const Value: TDate);
    procedure SetPRO_COD_BARRA(const Value: String);
    procedure SetPRO_DESCRICAO(const Value: String);




   public


    Property COD_PRODUTO           : LongInt read FCOD_PRODUTO write SetCOD_PRODUTO;
    Property COD_UNIDADE           : LongInt read FCOD_UNIDADE write SetCOD_UNIDADE;
    Property COD_GRUPO             : LongInt read FCOD_GRUPO write SetCOD_GRUPO;
    Property COD_NCM               : String read FCOD_NCM write SetCOD_NCM;
    Property COD_STATUS            : LongInt read FCOD_STATUS write SetCOD_STATUS;
    Property PRO_CADASTRO          : TDate read FPRO_CADASTRO write SetPRO_CADASTRO;
    Property PRO_DESCRICAO         : String read FPRO_DESCRICAO write SetPRO_DESCRICAO;
    Property PRO_COD_BARRA         : String read FPRO_COD_BARRA write SetPRO_COD_BARRA;




 End;




implementation





{ TProduto }

procedure TProduto.SetCOD_GRUPO(const Value: LongInt);
begin
  FCOD_GRUPO := Value;
end;

procedure TProduto.SetCOD_NCM(const Value: String);
begin
  FCOD_NCM := Value;
end;

procedure TProduto.SetCOD_PRODUTO(const Value: LongInt);
begin
  FCOD_PRODUTO := Value;
end;

procedure TProduto.SetCOD_STATUS(const Value: LongInt);
begin
  FCOD_STATUS := Value;
end;

procedure TProduto.SetCOD_UNIDADE(const Value: LongInt);
begin
  FCOD_UNIDADE := Value;
end;

procedure TProduto.SetPRO_CADASTRO(const Value: TDate);
begin
  FPRO_CADASTRO := Value;
end;

procedure TProduto.SetPRO_COD_BARRA(const Value: String);
begin
  FPRO_COD_BARRA := Value;
end;

procedure TProduto.SetPRO_DESCRICAO(const Value: String);
begin
  FPRO_DESCRICAO := Value;
end;

end.
