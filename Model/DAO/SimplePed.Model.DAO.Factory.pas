unit SimplePed.Model.DAO.Factory;

interface

uses
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.PRODUTO,
  SimplePed.Model.Entidade.PEDIDO,
  SimplePed.Model.Entidade.PEDIDOITENS;

type
  TModelDAOFactory = class(TInterfacedObject, iModelDAOFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAOFactory;
    function PRODUTO: iModelDAO<TPRODUTO>;
    function PEDIDO: iModelDAO<TPEDIDO>;
    function PEDIDOITENS: iModelDAO<TPEDIDOITENS>;
  end;

implementation

{ TModelDAOFactory }

uses
  SimplePed.Model.DAO.SQL;

constructor TModelDAOFactory.Create;
begin

end;

destructor TModelDAOFactory.Destroy;
begin

  inherited;
end;

class function TModelDAOFactory.New: iModelDAOFactory;
begin
  Result := Self.Create;
end;

function TModelDAOFactory.PEDIDO: iModelDAO<TPEDIDO>;
begin
  Result := TModelDAO<TPEDIDO>.New;
end;

function TModelDAOFactory.PEDIDOITENS: iModelDAO<TPEDIDOITENS>;
begin
  Result := TModelDAO<TPEDIDOITENS>.New;
end;

function TModelDAOFactory.PRODUTO: iModelDAO<TPRODUTO>;
begin
  Result := TModelDAO<TPRODUTO>.New;
end;

end.
