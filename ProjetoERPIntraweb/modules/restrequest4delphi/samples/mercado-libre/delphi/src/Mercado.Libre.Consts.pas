unit Mercado.Libre.Consts;

interface

const
  ML_APIBASE = 'https://api.mercadolibre.com';

  /// <summary>
  /// Cada vez que realize a chamada que muda o code por um ACCESS_TOKEN,
  /// tamb�m ter� o dado de um refresh_token, que dever� guardar para
  /// troc�-lo por um ACCESS_TOKEN uma vez expirado.
  /// Para renovar seu ACCESS_TOKEN dever� realizar a chamada seguinte:
  /// </summary>
  ML_POST_REFRESHTOKEN = 'oauth/token?grant_type=refresh_token&client_id={app_id}&client_secret={secret_key}&refresh_token={refresh_token}';

  ML_GET_CATEGORIES_SITE = '/sites/MLB/categories';
  ML_GET_CATEGORIES_INFO = '/categories/{category_id}';
  ML_GET_CATEGORIE_ATTRIBUTTES = '/categories/{category_id}/attributes';
  ML_GET_USERTEST = '/users/test_user';
  ML_GET_MODOSENVIO = '/users/{user_id}';
  ML_GET_LISTING_TYPES = '/sites/MLB/listing_types';
  ML_POST_ITEM = '/items';
  ML_GET_ITEM = '/items/{item_id}';
  ML_PUT_ITEM = '/items/{item_id}';
  ML_POST_ITEM_RELIST = '/items/{item_id}/relist';
  ML_UPLOAD_PICTURE = '/pictures';

  /// <summary>
  /// Recupera a comiss�o associada ao tipo de publica��o e categoria
  /// </summary>
  ML_LISTING_PRICES_LIST_TYPE_CATEGORY = '/sites/MLB/listing_prices/{listing_type}?category_id={category_id}&price={price}';

  /// <summary>
  /// Calcular custos de frete gr�tis antes de publicar um item
  /// Utilize esse recurso para calcular os custos de frete gr�tis antes da publica��o. Para isso, � necessario informar alguns par�metros:
  /// </summary>
  ML_SHIPPING_OPTIONS = '/users/{user_id}/shipping_options/free?currency_id=BRL&listing_type_id={listing_type_id}&condition=new&category_id={category_id}&item_price={item_price}&verbose=true&dimensions={dimensions}';

  /// <summary>
  /// Dimens�es produtos tipos de envios
  /// Voc� pode conhecer, por meio de uma chamada GET, as dimens�es padr�o da categoria
  /// de envios (peso, altura, largura e profundidade) e os tipos de log�stica dispon�veis nessa categoria.
  // Quando as dimens�es do produto n�o s�o especificadas, voc� deve executar o c�lculo com base nas dimens�es padr�o.
  /// </summary>
  ML_SHIPPING_DIMENSION = '/categories/{category_id}/shipping_preferences';

  {$REGION 'Gerenciamento de Vendas'}
  /// <summary>
  /// Receba uma ordem
  /// Quando uma nova ordem � criada no usu�rio, os detalhes podem ser consultados
  /// atrav�s de uma solicita��o ao recurso de ordens:
  /// </summary>
  ML_GET_ORDER = '/orders/{order_id}';

  /// <summary>
  /// Para realizar o faturamento de uma venda, s�o necess�rios os dados do comprador que est�o dispon�veis atrav�s do recurso Orders,
  /// mas espec�ficamente /orders/order_id/billing_info.
  /// </summary>
  ML_GET_ORDER_BILLING_INFO = '/orders/{order_id}/billing_info';
  {$ENDREGION}

  /// <summary>
  /// Consultar status do envio
  /// Conhecendo o ID do envio, poder� realizar o GET para o recurso de shipments para obter toda a informa��o dele:
  /// </summary>
  ML_GET_SHIPIMENT = '/shipments/{shipping_id}';

  /// <summary>
  /// Billing Info
  /// No recurso/shipments s�o derivados diferentes recursos que oferecem a informa��o necess�ria para que o vendedor determine a log�stica.
  /// O recurso billing_info permite obter a informa��o fiscal dos diferentes atores que operam no envio do produto.
  /// </summary>
  ML_GET_SHIPIMENT_BILLING_INFO = '/shipments/{shipping_id}/billing_info';

  {$REGION 'Usu�rios e Aplicativos - Os seguintes recursos servir�o para trabalhar com usu�rios e aplicativos registrados no Mercado Livre'}
  /// <summary> Informa��o da conta do usu�rio.</summary>
  ML_GET_USR_INF = '/users/{cust_id}';
  ML_GET_USR_INF_REGEX = '/users/:cust_id';
  /// <summary> Obt�m a informa��o do usu�rio que fez login na conta.</summary>
  ML_GET_USR_LOGIN = '/users/me';
  /// <summary> Obt�m endere�o associados � conta do usu�rio.</summary>
  ML_GET_USR_ADDRESSES = '/users/{cust_id}/addresses';
  /// <summary> Obt�m os m�todos de pagamento aceitos pelo vendedor para cobrar.</summary>
  ML_GET_USR_ACCEPTED_PAYMENT_METHODS = '/users/{cust_id}/accepted_payment_methods';
  /// <summary> Obt�m dados sobre o aplicativo.</summary>
  ML_GET_APP_INF = '/applications/{application_id}';
  /// <summary> Este processo recupera marcas associadas a um user_id. O atributo oficial_store identifica uma loja.</summary>
  ML_GET_USR_BRANDS = '/users/{user_id}/brands';
  /// <summary> Obt�m informa��o dos pacotes de promo��o para o usu�rio. IM�VEIS</summary>
  ML_GET_USR_CLASSIFIEDS_PROMOTION_PACKS = '/users/{user_id}/classifieds_promotion_packs';
  /// <summary> Obter a disponibilidades para o usu�rio � listagem debaixo de um determinado tipo de venda e de categoria.</summary>
  ML_GET_USR_CLASSIFIEDS_PROMOTION_PACKS_EXT = '/users/{user_id}/classifieds_promotion_packs/{listing_type}&categoryId={category_id}';
  /// <summary> Listing types disponiv�is por usu�rios e categorias.</summary>
  ML_GET_USR_AVAILABLE_LISTING_TYPES = '/users/{Cust_id}/available_listing_types?category_id={Category_id}';
  /// <summary> Obter o listing types dispon�vel baixo um tipo de listagem segundo uma categoria outorgada.</summary>
  ML_GET_USR_AVAILABLE_LISTING_TYPES_EXT = '/users/{Cust_id}/available_listing_type/{listing_type_id}?category_id={Category_id}';
  /// <summary> Revogar Permiss�o do aplicativo</summary>
  ML_DELETE_USR_APPLICATIONS = '/users/{user_id}/applications/{app_id}';
  /// <summary> Hist�rico de notifica��es.</summary>
  ML_GET_MYFEEDS = '/myfeeds?app_id={app_id}';
  {$ENDREGION}

implementation

end.
