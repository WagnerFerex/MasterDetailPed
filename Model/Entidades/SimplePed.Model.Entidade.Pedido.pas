unit SimplePed.Model.Entidade.PEDIDO;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDO')]
  TPEDIDO = class
  private
    FID: Integer;
    FDATA: TDateTime;
  public
    [Campo('ID_PEDIDO'), PK, AutoInc]
    property ID : Integer read FID write FID;

    [Campo('DATA')]
    property DATA : TDateTime read FDATA write FDATA;
  end;

implementation


end.
