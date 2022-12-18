unit DataBase.DAO.Pedidos;

interface

uses
  System.Classes,
  System.StrUtils,
  DataBase.Entity.Pedidos,
  Buttons.Icons,
  DataBase.Funcoes,
  Integracao.Telegram;

  Procedure Get_Lista_Pedidos(Cod_Dav:Longint; Cod_DFe:LongInt; DataIni:TDate; DataFim:TDate;  Cod_Cliente:LongInt; Status:LongInt;  aParams: TStrings; out aResult: String);

//    function  Set_Produto (Produto:TProduto; var vResult:String):Boolean;
//    Function Get_Produto(ID:LongInt; Produto:TProduto; Var vResult:String):Boolean;



implementation

uses
  FireDAC.Comp.Client, System.SysUtils, ServerController, DataBase.BD.Funcoes;



Procedure Get_Lista_Pedidos(Cod_Dav:Longint; Cod_DFe:LongInt; DataIni:TDate; DataFim:TDate;  Cod_Cliente:LongInt; Status:LongInt;  aParams: TStrings; out aResult: String);
var
  Qry                     : TFDQuery;
  wresult,ModeloDFe       : string;
  wtotal                  : Integer;
  Btn_Detalhe,
  Btn_Editar,
  Btn_WhatsApp,
  Btn_Excluir,
  Btn_Duplicar,
  Btn_Imprimir,
  buttons,
  btnOptions,
  btn_AlterarPedido       : String;
  Status_Pedido           : String;
begin

  Qry := TFDQuery.Create(nil);

  Qry               := TFDQuery.Create(Nil);
  Qry.Connection    := UserSession.Conexao;

  Btn_Detalhe       := '';
  Btn_Editar        := '';
  Btn_WhatsApp      := '';
  Btn_Excluir       := '';
  Btn_Duplicar      := '';
  Btn_Imprimir      := '';
  buttons           := '';
  Status_Pedido     := '';

  try

    Qry.SQL.Add('select                                                               ');
    Qry.SQL.Add('d.cod_dav,                                                           ');
    Qry.SQL.Add('p.pes_razao,                                                         ');
    Qry.SQL.Add('d.cod_funcionario,                                                   ');
    Qry.SQL.Add('d.dav_emissao,                                                       ');
    Qry.SQL.Add('d.dav_total_produto,                                                 ');
    Qry.SQL.Add('d.dav_qtde_itens,                                                    ');
    Qry.SQL.Add('d.dav_acrescimo,                                                     ');
    Qry.SQL.Add('d.dav_desconto,                                                      ');
    Qry.SQL.Add('d.dav_total,                                                         ');
    Qry.SQL.Add('d.cod_dfe,                                                           ');
    Qry.SQL.Add('d.dav_modelo,                                                        ');
    Qry.SQL.Add('d.cod_status,                                                        ');
    Qry.SQL.Add('d.dav_motorista,                                                     ');
    Qry.SQL.Add('d.dav_veiculo,                                                       ');
    Qry.SQL.Add('d.dav_placa,                                                         ');
    Qry.SQL.Add('s.sta_descricao,                                                     ');
    Qry.SQL.Add('p.cod_pessoa                                                         ');
    Qry.SQL.Add('from dav d                                                           ');
    Qry.SQL.Add('left join pessoa p on (d.cod_pessoa = p.cod_pessoa)                  ');
    Qry.SQL.Add('left join status s on s.cod_status = d.cod_status                    ');
    Qry.SQL.Add(' where  cast(d.dav_emissao as date) >='+QuotedStr(Formatdatetime('dd.mm.yyyy',DataIni))+' and cast( d.dav_emissao as date) <='+QuotedStr(Formatdatetime('dd.mm.yyyy',DataFim)) );

    if Cod_Dav > 0 then begin

     Qry.SQL.Add(' AND  COD_DAV ='+QuotedStr(IntToStr(Cod_Dav)));

    end;

    if Cod_DFe > 0 then begin

    Qry.SQL.Add(' AND  COD_DFE ='+QuotedStr(IntToStr(Cod_DFe)));

    end;



    if Cod_Cliente > 0 then begin

      Qry.SQL.Add(' AND  P.COD_PESSOA ='+QuotedStr(IntToStr(Cod_Cliente)));

    end;



    if Status > 0 then begin

     Qry.SQL.Add(' AND  d.COD_STATUS ='+QuotedStr(IntToStr(Status)));

    end;


    Qry.SQL.Add('  order by dav_emissao desc                       ');

    Qry.FetchOptions.RecsMax:=StrToInt(aParams.Values['length']);
    Qry.FetchOptions.RecsSkip:=StrToInt(aParams.Values['start']);

    Qry.Open;

    wtotal := Qry.RecordCount;

    wresult:='{'+
      '"draw": '+StrToIntDef(aParams.Values['draw'],0).ToString + ', ' +
      '"recordsTotal": '+wtotal.ToString + ', ' +
      '"recordsFiltered": '+wtotal.ToString + ', ' +
      '"data": [';

    while not Qry.Eof do
    begin

      Btn_Detalhe       := '';
      Btn_Editar        := '';
      Btn_WhatsApp      := '';
      Btn_Excluir       := '';
      Btn_Duplicar      := '';
      Btn_Imprimir      := '';
      buttons           := '';



      Btn_Editar        := ' <button data-toggle=\"tooltip\" data-placement=\"top\" title=\"Editar\" type=\"button\" class=\"btn btn-warning '+'btn-xs'+'\"   onclick=\"ajaxCall(''Crud'', ''Edit='+Qry.FieldByName('cod_dav').AsString+''')\"><i class=\"'+Icon_Edit+'\"></i></button> ';
      Btn_WhatsApp      := ' <button id=\"BTN_WHATSaPP\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"WhatsApp\" type=\"button\" class=\"btn btn-whatsapp '+'btn-xs'+'\"   onclick=\"ajaxCall(''Crud'', ''Zap='+Qry.FieldByName('cod_dav').AsString+''')\"><i class=\"'+Icon_WhatsApp+'\"></i></button> ';
      Btn_Excluir       := ' <button data-toggle=\"tooltip\" data-placement=\"top\" title=\"Excluir\" type=\"button\" class=\"btn btn-danger '+'btn-xs'+'\"   onclick=\"ajaxCall(''Crud'', ''Delete='+Qry.FieldByName('cod_dav').AsString+''')\"><i class=\"'+Icon_Delete+'\"></i></button>';
      Btn_Imprimir      := ' <button data-toggle=\"tooltip\" data-placement=\"top\" title=\"Imprimir\" type=\"button\" class=\"btn btn-primary  '+'btn-xs'+'\"   onclick=\"ajaxCall(''Crud'', ''Imprimir='+Qry.FieldByName('cod_dav').AsString+''')\"><i class=\"'+Icon_print+'\"></i></button> ';



      case Qry.FieldByName('cod_status').AsInteger of


       1 : begin //EM ERRO DE ENVIO

              buttons := Btn_Imprimir + Btn_WhatsApp + Btn_Editar +  btnOptions;

           end;



       4 : begin //EM DIGITAÇÃO

              buttons := Btn_Imprimir + Btn_WhatsApp + Btn_Editar + btnOptions;

           end;

       5 : begin  //CONCLUIDO

             buttons := Btn_Imprimir + Btn_WhatsApp +  btnOptions;

           end;

       6 : begin  //AGUARDANDO FATURAMENTO

             buttons := Btn_Imprimir + Btn_WhatsApp + Btn_Editar + btnOptions;

           end;

       7 : begin  //FINALIZADA

               buttons := Btn_Imprimir + Btn_WhatsApp + btnOptions;

           end;

       8 : begin  //EM ABERTO

              buttons := Btn_Imprimir + Btn_WhatsApp + Btn_Editar + btnOptions;

           end;


       9  : begin //CANCELADO

                buttons := Btn_Imprimir + Btn_WhatsApp;

            end;

       10  : begin //CANCELADO

                buttons := Btn_Imprimir + Btn_WhatsApp ;

            end;


       100 : begin //NFE- AUTORIZADA

                buttons := Btn_Imprimir + Btn_WhatsApp +  btnOptions;

            end;


       101  : begin //CANCELADO

              buttons := Btn_Imprimir+Btn_Duplicar+Btn_WhatsApp+Btn_Detalhe;

            end;

       102  : begin //INUTILIZADA

              buttons := Btn_Imprimir+Btn_Duplicar+Btn_WhatsApp+Btn_Detalhe;

            end;


       110  : begin //DENEGADA

              buttons := Btn_Detalhe + Btn_Duplicar + Btn_Imprimir+Btn_WhatsApp;

            end;


      end;

      ModeloDFe := '';

      case Qry.FieldByName('DAV_MODELO').AsInteger of

      55 : begin
              //ModeloDFe     := ' - NF-e';

            if Qry.FieldByName('COD_STATUS').AsInteger = 100 then
              begin

               ModeloDFe     := ' <b style=\"color:Green\">'+'NF-e'+'</b> '  ;

              end
              else begin

               ModeloDFe     := ' <b style=\"color:Red\">'+'NF-e'+'</b> '  ;

              end;


           end;


       65 : begin
             // ModeloDFe     := ' - NFC-e';

            if Qry.FieldByName('COD_STATUS').AsInteger = 100 then
              begin

               ModeloDFe     := ' <b style=\"color:Green\">'+'NFC-e'+'</b> '  ;

              end
              else begin

               ModeloDFe     := ' <b style=\"color:Red\">'+'NFC-e'+'</b> '  ;

              end;


           end;

      end;


      Status_Pedido   :=  Trim(Qry.FieldByName('sta_descricao').AsString);


      case Qry.FieldByName('COD_STATUS').AsInteger of

       1    : Status_Pedido := '<span class="badge badge-primary">'+Trim(Qry.FieldByName('sta_descricao').AsString)+'</span>';
       8    : Status_Pedido := '<span class="badge badge-warning">'+Trim(Qry.FieldByName('sta_descricao').AsString)+'</span>';
       100  : Status_Pedido := '<span class="badge badge-success">'+Trim(Qry.FieldByName('sta_descricao').AsString)+'</span>';
       101  : Status_Pedido := '<span class="badge badge-danger">'+Trim(Qry.FieldByName('sta_descricao').AsString)+'</span>';
       110  : Status_Pedido := '<span class="badge badge-secondary">'+Trim(Qry.FieldByName('sta_descricao').AsString)+'</span>';
       102  : Status_Pedido := '<span class="badge badge-dark">'+Trim(Qry.FieldByName('sta_descricao').AsString)+'</span>';
       150  : Status_Pedido := '<span class="badge badge-info">'+Trim(Qry.FieldByName('sta_descricao').AsString)+'</span>';

      end;


      wresult := wresult + '['+
                           '"'+IntToStr(Qry.FieldByName('COD_DAV').AsInteger)+'", '+
                           '"'+StringReplace(Trim(Qry.FieldByName('dav_emissao').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+ModeloDFe+'", '+
                            '"'+StringReplace(Trim(Qry.FieldByName('COD_DFE').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+StringReplace(Trim(Qry.FieldByName('pes_razao').AsString), '"', '\"', [rfReplaceAll])+'", '+
                           '"'+StringReplace(Status_Pedido, '"', '\"', [rfReplaceAll])+'", '+
                           '"R$ '+Trim(CurrToStr(Qry.FieldByName('dav_total').AsCurrency))+'", '+
                           '"'+
                              buttons +
                           '"'+

                           '],';
      Qry.Next;
    end;
     Qry.Close;
    if wtotal <= 0 then
      wresult := wresult + ']}'
    else
      wresult := LeftStr(Trim(wresult),Length(Trim(wresult))-1) + ']}';

    aResult := wresult;

  finally
    Qry.Free;
  end;



end;




//Function Get_Produto(ID:LongInt; Produto:TProduto; Var vResult:String):Boolean;
//var
//  Qry        : TFDQuery;
//  wresult    : string;
//begin
//
//   Result := False;
//
//
//
//   try
//
//
//    Qry               := TFDQuery.Create(Nil);
//    Qry.Connection    := UserSession.Conexao;
//
//
//    Qry.Close;
//    Qry.SQL.Clear;
//    Qry.SQL.Add(' select * from PRODUTO ');
//    Qry.SQL.Add(' where cod_produto=:cod_produto');
//    Qry.ParamByName('cod_produto').AsInteger   := ID;
//
//
//     try
//
//      Qry.Open;
//
//      if Qry.Eof then
//      exit;
//
//
//      Produto.COD_PRODUTO            := Qry.FieldByName('COD_PRODUTO').AsInteger;
//      Produto.PRO_DESCRICAO          := Qry.FieldByName('PRO_DESCRICAO').AsString;
//      Produto.COD_UNIDADE            := Qry.FieldByName('COD_UNIDADE').AsInteger;
//      Produto.COD_GRUPO              := Qry.FieldByName('COD_GRUPO').AsInteger;
//      Produto.COD_NCM                := Qry.FieldByName('COD_NCM').AsString;
//      Produto.PRO_COD_BARRA          := Qry.FieldByName('PRO_COD_BARRA').AsString;
//
//      Result := True;
//
//      vResult    := 'Informações Populadas';
//
//     except on E: Exception do
//
//
//     vResult   :=e.Message;
//
//
//     end;
//
//
//
//
//
//
//
//
//
//   finally
//
//
//   Qry.Free;
//
//   end;
//
//
//
//
// end;



//function  Set_Produto (Produto:TProduto; var vResult:String):Boolean;
//var
//Qry  : TFDQuery;
//begin
//
//  Result := False;
//
//
//  try
//
//   try
//
//    Qry             := TFDQuery.Create(Nil);
//    Qry.Connection  := UserSession.Conexao;
//
//
//    Qry.Close;
//    Qry.SQL.Clear;
//    Qry.SQL.Add('Select * from PRODUTO where COD_PRODUTO =:COD_PRODUTO');
//    Qry.ParamByName('COD_PRODUTO').AsInteger   := pRODUTO.COD_PRODUTO;
//    Qry.Open();
//
//
//      if pRODUTO.COD_PRODUTO = 0 then begin
//
//        Qry.Append;
//
//        Set_AjusteGenerator('COD_PRODUTO','COD_PRODUTO','PRODUTO');
//        Produto.COD_PRODUTO                 := Get_ReturnNextCOD('COD_PRODUTO');
//        vResult := 'Cadastro Nº '+Produto.COD_PRODUTO.ToString+'Realizado com Sucesso';
//
//      end else begin
//
//        Qry.Edit;
//
//        Qry.FieldByName('COD_PESSOA').AsInteger  := Produto.COD_PRODUTO;
//
//        vResult := 'Produto de Nº'+Produto.COD_PRODUTO.ToString+' Realizada Com Sucesso';
//
//      end;
//
//
//
//      Qry.FieldByName('COD_PRODUTO').AsInteger           := Produto.COD_PRODUTO;
//      Qry.FieldByName('COD_STATUS').AsInteger            := Produto.COD_STATUS;
//      Qry.FieldByName('PRO_DESCRICAO').AsString          := Produto.PRO_DESCRICAO;
//      Qry.FieldByName('PRO_COD_BARRA').AsString          := Produto.PRO_COD_BARRA;
//
//      Qry.Post;
//
//      Result := True;
//
//
//
//
//   except on E: Exception do
//
//
////   Telegram_Send('*** ERROR DataBase.Dao.Pessoa Set_Produto'+sLineBreak+
////                e.Message);
//
//   end;
//
//
//
//  finally
//
//  Qry.Free;
//
//  end;
//
//
//
//end;
//


end.
