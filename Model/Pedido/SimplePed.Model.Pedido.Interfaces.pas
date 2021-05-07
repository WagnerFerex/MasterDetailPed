unit SimplePed.Model.Pedido.Interfaces;

interface

uses
  Data.DB,
  SimplePed.Model.Entidade.Pedido,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.PedidoItens;

type
  iModelPedido = interface
    ['{3B23189E-D0F9-4218-92BD-FDC3F7977D50}']
    function Entidade : TPEDIDO; overload;
    function Entidade (aEntidade : TPEDIDO) : iModelPedido; overload;
    function DAO : iModelDAO<TPEDIDO>;
    function DataSource(aDataSource : TDataSource) : iModelPedido;
  end;

implementation

end.
