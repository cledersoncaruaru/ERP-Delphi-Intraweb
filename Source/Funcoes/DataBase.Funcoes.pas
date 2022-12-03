unit DataBase.Funcoes;

interface

  uses

  Integracao.Telegram,

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


     Function Set_AjusteGenerator(NomeGenerator: String; FieldIDMax: String; Tabela: String): boolean;
     Function Get_ReturnNextCOD(NomeGenerator: String): Longint;





implementation

 uses
  ServerController, System.SysUtils;


Function Set_AjusteGenerator(NomeGenerator: String; FieldIDMax: String; Tabela: String): boolean;
var
  IDMax        : Longint;
  Qry          : TFDQuery;
begin

  Result := False;

  Qry             := TFDQuery.Create(nil);
  Qry.Connection  := UserSession.Conexao;


  try


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('Select coalesce(max(' + FieldIDMax + '),0) from ' + Tabela);

    try

     Qry.Open;

    except on E: Exception do


//      Telegram_Send('DataBase.Funcoes  Set_AjusteGenerator'+
//                            ' - Error: '+ E.Message);


    end;





    IDMax := Qry.Fields[0].AsInteger;


    if IDMax > 0 then begin

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('SET GENERATOR ' + NomeGenerator + ' TO ' + IntToStr(IDMax));

      Qry.ExecSQL;
      Result := True;



    end;

  finally
    Qry.free;
  end;

end;


Function Get_ReturnNextCOD(NomeGenerator: String): Longint;
var
  Qry : TFDQuery;
BEGIN

  Result := 0;

  Qry             := TFDQuery.Create(nil);
  Qry.Connection  := UserSession.Conexao;


  try

    Qry.SQL.Add('SELECT GEN_ID(' + NomeGenerator + ', 1) AS NEWID FROM RDB$DATABASE');
    Qry.Open;

    If Qry.RecordCount <= 0 Then
      Exit;

    Result := StrToInt(Qry.FieldValues['NEWID']);

    If Result <= 0 Then
      Result := 0;

  finally
    Qry.DisposeOf;
  end;



END;




end.
