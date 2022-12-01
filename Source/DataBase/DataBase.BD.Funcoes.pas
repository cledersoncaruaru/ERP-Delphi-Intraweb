unit DataBase.BD.Funcoes;

interface

  uses

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Comp.Client,
  Data.DB, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet ;


  Function ReturnCountSQL(Query: TFDQuery): Longint;




implementation

uses
   System.SysUtils, ServerController;


Function ReturnCountSQL(Query: TFDQuery): Longint;
var
  Qry : TFDQuery;
begin

  Result:= 0;

  Qry := TFDQuery.Create(nil);

  Qry.Connection := UserSession.Conexao;

  try

    Qry.SQL.Add('SELECT COUNT(*) FROM (' + Query.SQL.Text + ') AS TEMP1');

    try
      Qry.Open;
      Result := Qry.Fields[0].AsInteger;
     except

      on E: Exception do begin

//        Telegram_Send('DataBase.Functions - ReturnCountSQL - '+ E.Message);

      end;

    end;

  finally
    Qry.Free;
  end;


end;


end.

