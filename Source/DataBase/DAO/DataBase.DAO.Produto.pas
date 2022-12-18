unit DataBase.DAO.Produto;

interface

uses
  System.Classes,
  System.StrUtils,
  DataBase.Entity.Produto,
  DataBase.Funcoes,
  Integracao.Telegram;

    Procedure Get_Lista_Produto(FiltrarPor:Longint; aParams: TStrings; out aResult: String);
    function  Set_Produto (Produto:TProduto; var vResult:String):Boolean;
    Function Get_Produto(ID:LongInt; Produto:TProduto; Var vResult:String):Boolean;



implementation

uses
  FireDAC.Comp.Client, System.SysUtils, ServerController, DataBase.BD.Funcoes;


Function Get_Produto(ID:LongInt; Produto:TProduto; Var vResult:String):Boolean;
var
  Qry        : TFDQuery;
  wresult    : string;
begin

   Result := False;



   try


    Qry               := TFDQuery.Create(Nil);
    Qry.Connection    := UserSession.Conexao;


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(' select * from PRODUTO ');
    Qry.SQL.Add(' where cod_produto=:cod_produto');
    Qry.ParamByName('cod_produto').AsInteger   := ID;


     try

      Qry.Open;

      if Qry.Eof then
      exit;


      Produto.COD_PRODUTO            := Qry.FieldByName('COD_PRODUTO').AsInteger;
      Produto.PRO_DESCRICAO          := Qry.FieldByName('PRO_DESCRICAO').AsString;
      Produto.COD_UNIDADE            := Qry.FieldByName('COD_UNIDADE').AsInteger;
      Produto.COD_GRUPO              := Qry.FieldByName('COD_GRUPO').AsInteger;
      Produto.COD_NCM                := Qry.FieldByName('COD_NCM').AsString;
      Produto.PRO_COD_BARRA          := Qry.FieldByName('PRO_COD_BARRA').AsString;

      Result := True;

      vResult    := 'Informações Populadas';

     except on E: Exception do


     vResult   :=e.Message;


     end;









   finally


   Qry.Free;

   end;




 end;


Procedure Get_Lista_Produto(FiltrarPor:Longint; aParams: TStrings; out aResult: String);
var
  Qry        : TFDQuery;
  wresult    : string;
  wtotal     : Integer;
begin


 try


   try


    Qry               := TFDQuery.Create(Nil);
    Qry.Connection    := UserSession.Conexao;


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(' select * from PRODUTO ');


    if FiltrarPor < 0 then
       FiltrarPor:= 1;




    case FiltrarPor of

      0 :begin

          if StrToIntDef(aParams.Values['search[value]'],0) > 0 then begin

             Qry.SQL.Add(' where COD_PRODUTO ='+aParams.Values['search[value]']);

          end;


         end;

      1 : Qry.SQL.Add(' where PRO_DESCRICAO like ''%'+StringReplace(UpperCase(aParams.Values['search[value]']), ' ', '%', [rfReplaceAll])+'%'' ');
      2 : Qry.SQL.Add(' where PRO_COD_BARRA like ''%'+StringReplace(UpperCase(aParams.Values['search[value]']), ' ', '%', [rfReplaceAll])+'%'' ');


    end;

    case aParams.Values['order[0][column]'].ToInteger of

      0: Qry.SQL.Add('Order by COD_PRODUTO '+aParams.Values['order[0][dir]'] + ' ');
      1: Qry.SQL.Add('Order by PRO_DESCRICAO '+aParams.Values['order[0][dir]'] + ' ');
      2: Qry.SQL.Add('Order by PRO_COD_BARRA '+aParams.Values['order[0][dir]'] + ' ');

    end;

    Qry.FetchOptions.RecsMax:=StrToInt(aParams.Values['length']);
    Qry.FetchOptions.RecsSkip:=StrToInt(aParams.Values['start']);

    Qry.Open;

    wtotal := ReturnCountSQL(Qry);

    wresult:='{'+
      '"draw": '+StrToIntDef(aParams.Values['draw'],0).ToString + ', ' +
      '"recordsTotal": '+wtotal.ToString + ', ' +
      '"recordsFiltered": '+wtotal.ToString + ', ' +
      '"data": [';

    while not Qry.Eof do
    begin

        wresult := wresult + '['+
                           '"'+StringReplace(Trim(IntToStr(Qry.FieldByName('COD_PRODUTO').AsInteger)), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+StringReplace(Trim(Qry.FieldByName('PRO_DESCRICAO').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+StringReplace(Trim(Qry.FieldByName('PRO_COD_BARRA').AsString), '"', '\"', [rfReplaceAll])+'", '+
//                           '"'+StringReplace(Trim(Qry.FieldByName('PES_WHATSAPP').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"<button type=\"button\" class=\"btn btn-warning '+'btn-xs'+'\"    onclick=\"ajaxCall(''Crud'', ''Edit='+Qry.FieldByName('COD_PRODUTO').AsString+''')\"><i class=\"fas fa-pencil-alt\"></i></button> '+
                           ' <button type=\"button\" class=\"btn btn-danger '+'btn-xs'+'\"   onclick=\"ajaxCall(''Crud'', ''Delete='+Qry.FieldByName('COD_PRODUTO').AsString+''')\"><i class=\"fas fa-times\"></i></button> "' +

                           '],';
      Qry.Next;
    end;
    Qry.Close;

    if wtotal <= 0 then
      wresult := wresult + ']}'
    else
      wresult := LeftStr(Trim(wresult),Length(Trim(wresult))-1) + ']}';

    aResult := wresult;



   except on E: Exception do

   // Aqui a Gente vai Disparar uma Mensagem para o Telegram
   // do Log de Erro

     Telegram_Send(' *** Error *** DataBase.Dao.Pessoa - Get_Lista_Pessoa'+sLineBreak+
     e.Message);


   end;



 finally

  Qry.Free;

 end;


end;

function  Set_Produto (Produto:TProduto; var vResult:String):Boolean;
var
Qry  : TFDQuery;
begin

  Result := False;


  try

   try

    Qry             := TFDQuery.Create(Nil);
    Qry.Connection  := UserSession.Conexao;


    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('Select * from PRODUTO where COD_PRODUTO =:COD_PRODUTO');
    Qry.ParamByName('COD_PRODUTO').AsInteger   := pRODUTO.COD_PRODUTO;
    Qry.Open();


      if pRODUTO.COD_PRODUTO = 0 then begin

        Qry.Append;

        Set_AjusteGenerator('COD_PRODUTO','COD_PRODUTO','PRODUTO');
        Produto.COD_PRODUTO                 := Get_ReturnNextCOD('COD_PRODUTO');
        vResult := 'Cadastro Nº '+Produto.COD_PRODUTO.ToString+'Realizado com Sucesso';

      end else begin

        Qry.Edit;

        Qry.FieldByName('COD_PESSOA').AsInteger  := Produto.COD_PRODUTO;

        vResult := 'Produto de Nº'+Produto.COD_PRODUTO.ToString+' Realizada Com Sucesso';

      end;



      Qry.FieldByName('COD_PRODUTO').AsInteger           := Produto.COD_PRODUTO;
      Qry.FieldByName('COD_STATUS').AsInteger            := Produto.COD_STATUS;
      Qry.FieldByName('PRO_DESCRICAO').AsString          := Produto.PRO_DESCRICAO;
      Qry.FieldByName('PRO_COD_BARRA').AsString          := Produto.PRO_COD_BARRA;

      Qry.Post;

      Result := True;




   except on E: Exception do


//   Telegram_Send('*** ERROR DataBase.Dao.Pessoa Set_Produto'+sLineBreak+
//                e.Message);

   end;



  finally

  Qry.Free;

  end;



end;



end.
