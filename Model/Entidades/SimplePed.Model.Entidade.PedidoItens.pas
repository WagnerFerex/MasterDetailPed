unit SimplePed.Model.Entidade.PedidoItens;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDOITENS')]
  TPEDIDOITENS = class
  private
    FID_PRODUTO: Integer;
    FID_PEDIDO: Integer;
    FVALORUNITARIO: Currency;
    FID: Integer;
    FVALORTOTAL: Currency;
    FQUANTIDADE: Currency;
  public
    [Campo('ID_PEDIDOITENS'), PK, AutoInc]
    property ID : Integer read FID write FID;
    [Campo('ID_PEDIDO'), FK]
    property ID_PEDIDO : Integer read FID_PEDIDO write FID_PEDIDO;
    [Campo('ID_PRODUTO'), FK, NotNull]
    property ID_PRODUTO : Integer read FID_PRODUTO write FID_PRODUTO;
    [Campo('VALORUNITARIO'), NotNull, NumberOnly]
    property VALORUNITARIO : Currency read FVALORUNITARIO write FVALORUNITARIO;
    [Campo('QUANTIDADE'), NotNull, NumberOnly]
    property QUANTIDADE : Currency read FQUANTIDADE write FQUANTIDADE;
    [Campo('VALORTOTAL'), Display('Vlr. Total'), NotNull, NumberOnly]
    property VALORTOTAL : Currency read FVALORTOTAL write FVALORTOTAL;
  end;

implementation

end.
