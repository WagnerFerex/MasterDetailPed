unit SimplePed.Model.Interfaces;

interface

uses
  SimplePed.Model.Pedido.Interfaces,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Entidade.PedidoItens;

type

  iModel = interface
    ['{2A108A7C-FAA6-42F5-8982-B70F1F79A212}']
    function Pedido : iModelPedido;
//    function PedidoItens : iModelDAO<TPEDIDOITENS>;
  end;

implementation

end.
