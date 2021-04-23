unit SimplePed.Model.Entidade.CUPOM;

interface

uses
  System.Generics.Collections,
  SimpleAttributes,
  SimplePed.Model.Entidade.CUPOMITENS;

type
  [Tabela('CUPOM')]
  TCUPOM = class
  private
    FID: Integer;
    FDATA: TDateTime;
    FTOTAL: Currency;
    FITENS: TObjectList<TCUPOMITENS>;
  public
    [Campo('ID_CUPOM'), PK, AutoInc]
    property ID : Integer read FID write FID;
    [Campo('DATA')]
    property DATA : TDateTime read FDATA write FDATA;
    [Campo('TOTAL')]
    property TOTAL : Currency read FTOTAL write FTOTAL;
    [Relationship('CUPOMITENS'), Ignore]
    property ITENS: TObjectList<TCUPOMITENS> read FITENS;
  end;

implementation

end.
