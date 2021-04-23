unit SimplePed.Model.Entidade.CUPOMITENS;

interface

uses
  SimpleAttributes;

type
  [Tabela('CUPOMITENS')]
  TCUPOMITENS = class
  private
    FID_PRODUTO: Integer;
    FVALORUNITARIO: Currency;
    FID: Integer;
    FVALORTOTAL: Currency;
    FQUANTIDADE: Currency;
    FID_CUPOM: Integer;
  public
    [Campo('ID_CUPOMITENS'), PK, AutoInc]
    property ID : Integer read FID write FID;
    [Campo('ID_PEDIDO'), FK]
    property ID_CUPOM : Integer read FID_CUPOM write FID_CUPOM;
    [Campo('ID_PRODUTO'), FK, NotNull]
    property ID_PRODUTO : Integer read FID_PRODUTO write FID_PRODUTO;
    [Campo('VALORUNITARIO'), NotNull, NumberOnly]
    property VALORUNITARIO : Currency read FVALORUNITARIO write FVALORUNITARIO;
    [Campo('QUANTIDADE'), NotNull, NumberOnly]
    property QUANTIDADE : Currency read FQUANTIDADE write FQUANTIDADE;
    [Campo('VALORTOTAL'), NotNull, NumberOnly]
    property VALORTOTAL : Currency read FVALORTOTAL write FVALORTOTAL;
  end;

implementation

end.
